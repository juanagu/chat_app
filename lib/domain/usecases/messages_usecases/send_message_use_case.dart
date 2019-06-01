import 'package:chat_app/domain/models/message_model.dart';
import 'package:chat_app/domain/usecases/repositories/message_repository.dart';

import '../base_params_use_case.dart';

class SendMessageUseCase implements BaseParamsUseCase<MessageModel ,MessageModel>{

  MessageRepository messageRepository;

  SendMessageUseCase(this.messageRepository);

  @override
  Future<MessageModel> perform(MessageModel param) {
    return this.messageRepository.sendMessage(param);
  }
}