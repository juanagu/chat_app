import 'package:chat_app/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserMapper {
  static List<UserModel> mapFromFirebase(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.map(userFromFirebase);
  }

  static UserModel userFromFirebase(DocumentSnapshot document) {
    return UserModel.newInstance(
        document["id"],
        document["nickname"],
        document["photoUrl"],
        document["aboutMe"]);
  }
}
