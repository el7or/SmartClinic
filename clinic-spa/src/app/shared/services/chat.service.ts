import { UserRole } from "./../../auth/auth.model";
import { Injectable, EventEmitter } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import {
  HubConnection,
  HubConnectionBuilder,
  HttpTransportType,
} from "@microsoft/signalr";

import {
  UserChat,
  Message,
  UnreadCount,
  NewMessageSent,
  MessageReceived,
} from "../../pages/chat/chat.model";
import { environment } from "../../../environments/environment";
import { AuthService } from "../../auth/auth.service";
import { NewPrescription } from "../../pages-pharmacy/pharmacy.model";
import * as signalR from "@aspnet/signalr";

@Injectable()
export class ChatService {
  baseUrl = environment.API_URL;
  chatHubURL = environment.HUB_URL;

  constructor(private http: HttpClient, private authService: AuthService) {
    this.createConnection();
    this.registerOnServerEvents();
    this.startConnection();
  }

  loadChatUsers() {
    return this.http.get<UserChat[]>(
      this.baseUrl +
        "Chat/GetChatUsers/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId
    );
  }

  loadMessages(userId: string) {
    return this.http.get<Message[]>(
      this.baseUrl +
        "Chat/GetChatMessages/" +
        this.authService.userId +
        "/" +
        userId
    );
  }

  postNewMessage(newMsg: NewMessageSent) {
    return this.http.post(
      this.baseUrl + "Chat/PostChatMessage/" + this.authService.userId,
      newMsg
    );
  }

  getUnreadCount() {
    return this.http.get<UnreadCount>(
      this.baseUrl +
        "Chat/GetUnreadCount/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId +
        (this.authService.roleName == UserRole.doctor
          ? "/" + this.authService.doctorId
          : "")
    );
  }

  readMessage(id) {
    return this.http.get(
      this.baseUrl + "Chat/ReadMessage/" + this.authService.userId + "/" + id
    );
  }

  /********   SignalR   *********/

  private _hubConnection: HubConnection;
  connectionEstablished = new EventEmitter<Boolean>();
  connectionIsEstablished = false;
  unReadExternalCount = new EventEmitter<number>();
  unReadChatCount = new EventEmitter<number>();
  messageReceived = new EventEmitter<MessageReceived>();
  bookingUpdated = new EventEmitter<string>();
  pharmacyPrescUpdated = new EventEmitter<NewPrescription>();

  private createConnection() {
    this._hubConnection = new HubConnectionBuilder()
      .withUrl(this.chatHubURL, {
        skipNegotiation: true,
        transport: HttpTransportType.WebSockets,
        accessTokenFactory: () => localStorage.getItem("token"),
      })
      .withAutomaticReconnect()
      .configureLogging(signalR.LogLevel.Information)
      .build();
  }

  private startConnection(): void {
    Object.defineProperty(WebSocket, "OPEN", { value: 1 });
    this._hubConnection
      .start()
      .then(() => {
        this.connectionIsEstablished = true;
        //console.log("Hub connection started");
        this.connectionEstablished.emit(true);
      })
      .catch((err) => {
        //console.log("Error while establishing connection, retrying...");
        console.error(err);
        setTimeout(function () {
          this.startConnection();
        }, 5000);
      });
  }

  /* updateUnreadExternalCount(id: string) {
    this._hubConnection.invoke("UpdateExternalCount", id);
  } */

  private registerOnServerEvents(): void {
    this._hubConnection.on("UpdateExternalCount", (data: number) => {
      this.unReadExternalCount.emit(data);
    });
    this._hubConnection.on("UpdateUnreadChatCount", (data: number) => {
      this.unReadChatCount.emit(data);
    });
    this._hubConnection.on("NewMessageReceived", (data: MessageReceived) => {
      this.messageReceived.emit(data);
    });
    this._hubConnection.on("UpdateTodayBooking", (data: string) => {
      this.bookingUpdated.emit(data);
    });
    this._hubConnection.on("UpdatePharmacyPresc", (data: NewPrescription) => {
      this.pharmacyPrescUpdated.emit(data);
    });

    this._hubConnection.onclose((err) => console.error(err));
  }

  stopConnection(): void {
    this._hubConnection.stop().then(() => {
      this.connectionIsEstablished = false;
      //console.log("Hub connection stoped");
      this.connectionEstablished.emit(false);
    });
  }
}
