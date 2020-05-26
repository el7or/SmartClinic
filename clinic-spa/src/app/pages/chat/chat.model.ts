export interface UserChat{
  id: string;
  name: string;
  title: string;
  picture: string;
  unread: number;
}
export interface Message{
  text: string;
  reply: boolean;
  date: Date;
  user: MessageUser;
}
export interface MessageUser{
  name:string;
  avatar:string;
}
export interface NewMessageSent{
  receiverId:string;
  messageText :string;
}
export interface MessageReceived{
  id;
  senderId:string;
  messageText :string;
}

export interface UnreadCount{
  unreadMessages:number;
  unreadExternals:number;
}
