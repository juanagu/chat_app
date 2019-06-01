import 'package:flutter/material.dart';

import 'home.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // var injector = Injector.fromModule(module: PlaceModule());
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       home: HomePage());
       // home: ChangeNotifierProvider<ConversationNotifier>(
        //  builder: (_) => ConversationNotifier(injector.get<GetConversationListUseCase>()),
        //  child: HomePage(),
        //));
  }
}