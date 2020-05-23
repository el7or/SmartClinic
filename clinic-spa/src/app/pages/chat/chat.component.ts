import { Subscription } from "rxjs";
import { Component, OnInit, OnDestroy, AfterViewInit } from "@angular/core";

import { AlertService } from "./../../shared/services/alert.service";
import { LanggService } from "./../../shared/services/langg.service";
import { ChatService } from "./chat.service";
import {
  UserChat,
  Message,
  NewMessageSent,
  MessageReceived,
} from "./chat.model";

@Component({
  selector: "ngx-chat",
  templateUrl: "chat.component.html",
  styleUrls: ["chat.component.scss"],
  providers: [ChatService],
})
export class ChatComponent implements OnInit, AfterViewInit, OnDestroy {
  usersLoading = false;
  msgLoading = false;
  users: UserChat[];
  userChatName: string;
  userChatId: string;
  messages: any[];

  getUsersSubs: Subscription;
  getMessagesSubs: Subscription;
  postMessageSubs: Subscription;

  constructor(
    public chatService: ChatService,
    private alertService: AlertService,
    private langgService: LanggService
  ) {
    this.chatService.messageReceived.subscribe((message: MessageReceived) => {
      if (message.senderId == this.userChatId) {
        const sender = this.users.filter((u) => u.id == message.senderId);
        this.messages.push({
          text: message.messageText,
          date: new Date(),
          reply: false,
          user: {
            name: sender[0].name,
            avatar: sender[0].picture,
          },
        });
      }
      else{
       if(this.users) this.users.find((u) => u.id == message.senderId).unread ++;
        // =====> need idea to prevent increase number of unread messages in header if open same chat user:
      }
    });
  }

  ngOnInit() {
    this.usersLoading = true;
    this.getUsersSubs = this.chatService.loadChatUsers().subscribe(
      (res: UserChat[]) => {
        this.users = res;
        this.usersLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.usersLoading = false;
      }
    );
  }
  ngAfterViewInit() {
    const noMessageText = document.querySelector("p.no-messages");
    noMessageText.innerHTML = this.langgService.translateWord(
      "No user selected."
    );
  }
  ngOnDestroy() {
    this.getUsersSubs.unsubscribe();
    if (this.getMessagesSubs) this.getMessagesSubs.unsubscribe();
    if (this.postMessageSubs) this.postMessageSubs.unsubscribe();
  }

  openChat(user) {
    this.msgLoading = true;
    this.userChatName = user.name;
    this.userChatId = user.id;
    this.getMessagesSubs = this.chatService.loadMessages(user.id).subscribe(
      (res: Message[]) => {
        const chatUser = this.users.filter((u) => u.id == user.id);
        chatUser[0].unread = null;
        this.messages = res;
        const noMessageText = document.querySelector("p.no-messages");
        if (noMessageText != null) {
          noMessageText.innerHTML = this.langgService.translateWord(
            "No messages yet."
          );
        }
        const typeMessagePlacholder = <HTMLInputElement>(
          document.querySelector("div.message-row input.with-button")
        );
        if (typeMessagePlacholder != null) {
          typeMessagePlacholder.placeholder = this.langgService.translateWord(
            "Type a message"
          );
        }
        this.msgLoading = false;
      },
      (error) => {
        console.error(error);
        this.alertService.alertError();
        this.msgLoading = false;
      }
    );
  }

  sendMessage(event: any) {
    this.msgLoading = true;
    const postObj: NewMessageSent = {
      receiverId: this.userChatId,
      messageText: event.message,
    };
    this.postMessageSubs = this.chatService.postNewMessage(postObj).subscribe(
      () => {
        //this.chatService.updateUnreadCount(this.userChatId);
        this.messages.push({
          text: event.message,
          date: new Date(),
          reply: true,
          user: {
            name: localStorage.getItem("nickName"),
            //avatar: this.authService.currentUserPhoto
          },
        });
        this.msgLoading = false;
      },
      (error) => {
        console.error(error);
        this.alertService.alertError();
        this.msgLoading = false;
      }
    );
  }
}
