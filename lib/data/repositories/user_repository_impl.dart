import 'package:chat_app/domain/models/user_model.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  UserRepository userFirebaseDataSource;

  UserRepositoryImpl(this.userFirebaseDataSource);

  @override
  Stream<List<UserModel>> getAll() {
    return this.userFirebaseDataSource.getAll();
  }

}