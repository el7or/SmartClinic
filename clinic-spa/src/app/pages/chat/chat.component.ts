import { Component } from '@angular/core';

import { ChatService } from './chat.service';

@Component({
  selector: 'ngx-chat',
  templateUrl: 'chat.component.html',
  styleUrls: ['chat.component.scss'],
  providers: [ ChatService ],
})
export class ChatComponent {
  users: {
    id: string;
    name: string;
    title: string;
    picture: string;
    unread: number;
  }[];
  userChatName: string;
  userChatId: string;
  messages: any[];
  loading = false;

  constructor(protected chatService: ChatService) {
    this.messages = this.chatService.loadMessages();
    this.users=[{
      id: '1',
      name: 'د محمد مصطفى',
      title: '2020-1-1',
      picture:  "assets/images/alan.png",
      unread : 5
    },{
      id: '2',
      name: 'حسن أحمد',
      title: '2019-6-1',
      picture:  "assets/images/jack.png",
      unread : 3
    },{
      id: '3',
      name: 'منى محمد',
      title: '2019-12-1',
      picture:  "assets/images/lee.png",
      unread : 0
    },
  ]
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
    const files = !event.files ? [] : event.files.map((file) => {
      return {
        url: file.src,
        type: file.type,
        icon: 'nb-compose',
      };
    });

    this.messages.push({
      text: event.message,
      date: new Date(),
      reply: true,
      type: files.length ? 'file' : 'text',
      files: files,
      user: {
        name: 'Jonh Doe',
        avatar: 'https://i.gifer.com/no.gif',
      },
    });
    const botReply = this.chatService.reply(event.message);
    if (botReply) {
      setTimeout(() => { this.messages.push(botReply); }, 500);
    }
  }
}
