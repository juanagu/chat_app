import 'dart:async';

import 'package:chat_app/domain/models/message_model.dart';
import 'package:chat_app/firebase_vision_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageProvider {
  static MessageModel messageFromfromFirestore(DocumentSnapshot doc) {
    return MessageModel.newInstance(doc['idFrom'], doc['idTo'], doc['content'],
        doc['type'], doc['timestamp']);
  }

  static Future<List<MessageModel>> mapFromFirebase(
      QuerySnapshot snapshot, String fromUserId) async {
    var messages = List<MessageModel>();

    for (int i = 0; i < snapshot.documents.length; i++) {
      var message = messageFromfromFirestore(snapshot.documents[i]);
      if (message.type == 0 && message.idFrom.compareTo(fromUserId) != 0) {
        message.message = await FirebaseVisionHelper.translate(message.message);
      }
      messages.add(message);
    }

    return messages;
  }
}
