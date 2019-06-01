import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final conversations = Provider.of<ConversationNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Text("Hola mundo"),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}