import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  _buildItem() {
    return new Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            'https://picsum.photos/250?image=9',
            width: 64.0,
            height: 64.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              child: Text("Nombre",
                  style: TextStyle(color: Colors.black, fontSize: 16.0)),
            ),
            Text("Mensaje",
                style: TextStyle(color: Colors.black, fontSize: 12.0)),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Chats"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: 10,
            itemBuilder: (BuildContext ctxt, int index) => _buildItem()));
  }
}
