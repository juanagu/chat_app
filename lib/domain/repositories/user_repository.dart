import 'package:chat_app/domain/models/user_model.dart';

abstract class UserRepository{
  Stream<List<UserModel>> getAll();
}