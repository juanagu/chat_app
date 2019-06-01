import 'package:chat_app/domain/models/message_model.dart';

abstract class MessageRepository{
  Future<MessageModel> sendMessage(MessageModel message);
}