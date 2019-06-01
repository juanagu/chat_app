import 'user_model.dart';

class MessageModel{
 String idFrom;
 String idTo;
 String message;
 int type;
 String timestamp;

  MessageModel.newInstance(this.idFrom,
      this.idTo,
      this.message,
      this.type,
      this.timestamp);
}