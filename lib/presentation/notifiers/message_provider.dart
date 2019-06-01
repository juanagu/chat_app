import 'dart:async';

import 'package:chat_app/domain/models/message_model.dart';
import 'package:chat_app/firebase_vision_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageProvider {
  Stream<List<MessageModel>> getMessages(groupChatId) {
    var ref = Firestore.instance
        .collection('messages')
        .document(groupChatId)
        .collection(groupChatId)
        .orderBy('timestamp', descending: true)
        .limit(20);

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => messageFromfromFirestore(doc)).toList());
  }

  static MessageModel messageFromfromFirestore(DocumentSnapshot doc) {
    return MessageModel.newInstance(doc['idFrom'], doc['idTo'], doc['content'],
        doc['type'], doc['timestamp']);
  }

  static Future<List<MessageModel>> mapFromFirebase(
      QuerySnapshot snapshot) async {
    var messages = List<MessageModel>();

    for (int i = 0; i < snapshot.documents.length; i++) {
      var message = messageFromfromFirestore(snapshot.documents[i]);
      if (message.type == 0) {
        message.message = await FirebaseVisionHelper.translate(message.message);
      }
      messages.add(message);
    }

    return messages;
  }
}
