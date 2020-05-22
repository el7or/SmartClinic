import { Injectable, EventEmitter } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import {
  HubConnection,
  HubConnectionBuilder,
  HttpTransportType,
} from "@aspnet/signalr";

import { messages } from "./messages";
import { botReplies, gifsLinks, imageLinks } from "./bot-replies";
import { environment } from "../../../environments/environment";
import { AuthService } from "../../auth/auth.service";

@Injectable()
export class ChatService {
  baseUrl = environment.API_URL;
  chatHubURL = environment.HUB_URL;

  constructor(private http: HttpClient, private authService: AuthService) {
    this.createConnection();
    this.registerOnServerEvents();
    this.startConnection();
  }

  loadMessages() {
    return messages;
  }

  loadBotReplies() {
    return botReplies;
  }

  reply(message: string) {
    const botReply: any = this.loadBotReplies().find(
      (reply: any) => message.search(reply.regExp) !== -1
    );

    if (botReply.reply.type === "quote") {
      botReply.reply.quote = message;
    }

    if (botReply.type === "gif") {
      botReply.reply.files[0].url =
        gifsLinks[Math.floor(Math.random() * gifsLinks.length)];
    }

    if (botReply.type === "pic") {
      botReply.reply.files[0].url =
        imageLinks[Math.floor(Math.random() * imageLinks.length)];
    }

    if (botReply.type === "group") {
      botReply.reply.files[1].url =
        gifsLinks[Math.floor(Math.random() * gifsLinks.length)];
      botReply.reply.files[2].url =
        imageLinks[Math.floor(Math.random() * imageLinks.length)];
    }

    botReply.reply.text =
      botReply.answerArray[
        Math.floor(Math.random() * botReply.answerArray.length)
      ];
    return { ...botReply.reply };
  }

  getExternalCount() {
    return this.http.get(
      this.baseUrl +
        "Chat/GetExternalCount/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }

  /********   SignalR   *********/

  private _hubConnection: HubConnection;
  unReadExternalCount = new EventEmitter<number>();
  /* chatUsersList = new EventEmitter<ChatUser[]>(); */
  connectionEstablished = new EventEmitter<Boolean>();
  connectionIsEstablished = false;

  private createConnection() {
    this._hubConnection = new HubConnectionBuilder()
      .withUrl(this.chatHubURL, {
        skipNegotiation: true,
        transport: HttpTransportType.WebSockets,
        accessTokenFactory: () => localStorage.getItem("token"),
      })
      .build();
  }
  private startConnection(): void {
    Object.defineProperty(WebSocket, "OPEN", { value: 1 });
    this._hubConnection
      .start()
      .then(() => {
        this.connectionIsEstablished = true;
        console.log("Hub connection started");
        this.connectionEstablished.emit(true);
      })
      .catch((err) => {
        console.log("Error while establishing connection, retrying...");
        setTimeout(function () {
          this.startConnection();
        }, 5000);
      });
  }

  updateUnreadExternalCount(id: string) {
    this._hubConnection.invoke("UpdateExternalCount", id);
  }

  private registerOnServerEvents(): void {
    this._hubConnection.on("UpdateExternalCount", (data: number) => {
      this.unReadExternalCount.emit(data);
    });
  }

  stopConnection(): void {
    this._hubConnection.stop().then(() => {
      this.connectionIsEstablished = false;
      console.log("Hub connection stoped");
      this.connectionEstablished.emit(false);
    });
  }
}
