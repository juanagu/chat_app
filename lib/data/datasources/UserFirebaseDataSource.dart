import 'package:chat_app/data/mappers/user_mapper.dart';
import 'package:chat_app/domain/models/user_model.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirebaseDataSource implements UserRepository {
  @override
  Stream<List<UserModel>> getAll() {
    return Firestore.instance
        .collection('users')
        .snapshots()
        .map(UserMapper.mapFromFirebase);
  }
}
