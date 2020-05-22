import { AlertService } from "./../../shared/services/alert.service";
import { Subscription } from "rxjs";
import { Component, OnInit, OnDestroy } from "@angular/core";

import { ChatService } from "./chat.service";
import { UserChat } from "./chat.model";

@Component({
  selector: "ngx-chat",
  templateUrl: "chat.component.html",
  styleUrls: ["chat.component.scss"],
  providers: [ChatService],
})
export class ChatComponent implements OnInit, OnDestroy {
  loading = false;
  users: UserChat[];
  userChatName: string;
  userChatId: string;
  messages: any[];

  getUsersSubs: Subscription;
  getMessagesSubs: Subscription;

  constructor(
    public chatService: ChatService,
    private alertService: AlertService
  ) {
    this.messages = this.chatService.loadMessages();
  }

  ngOnInit() {
    this.loading = true;
    this.getUsersSubs = this.chatService.loadChatUsers().subscribe(
      (res: UserChat[]) => {
        this.users = res;
        this.loading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.loading = false;
      }
    );
  }
  ngOnDestroy() {
    this.getUsersSubs.unsubscribe();
    if (this.getMessagesSubs) this.getMessagesSubs.unsubscribe();
  }

  openChat(user) {
    /* this.loading = true;
    this.messages = [];
    this.userChatName = user.name;
    this.userChatId = user.id;
    this.chatService.getChatList(user.id).subscribe(
      (response: any) => {
        const chatUser = this.users.filter(u => u.id == user.id);
        chatUser[0].unread = null;
        response.forEach(res => {
          this.messages.push({
            text: res.content,
            date: new Date(res.sentOn),
            reply: res.isReplay,
            user: {
              name: res.isReplay
                ? this.authService.currentUserNickName
                : user.name,
              avatar: res.isReplay
                ? this.authService.currentUserPhoto
                : user.picture
            }
          });
        });
        this.loading = false;
      },
      error => {
        console.error(error);
        this.toastrService.warning(
          new LanggPipe(this.langgService).transform(
            "Please refresh page and try again."
          ),
          new LanggPipe(this.langgService).transform("Something Wrong!"),
          { duration: 3000 }
        );
      },
      () => this.chatService.updateUnreadCount(this.authService.currentUserId)
    ); */
  }

  sendMessage(event: any) {
    const files = !event.files
      ? []
      : event.files.map((file) => {
          return {
            url: file.src,
            type: file.type,
            icon: "nb-compose",
          };
        });

    this.messages.push({
      text: event.message,
      date: new Date(),
      reply: true,
      type: files.length ? "file" : "text",
      files: files,
      user: {
        name: "Jonh Doe",
        avatar: "https://i.gifer.com/no.gif",
      },
    });
  }
}
