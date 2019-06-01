import 'package:flutter/material.dart';
import 'package:tech_talk_ml_kit/presentation/features/login_module/login_page.dart';

import 'features/chat_list_module/chat_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var injector = Injector.fromModule(module: PlaceModule());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChatListPage());
    // home: ChangeNotifierProvider<ConversationNotifier>(
    //  builder: (_) => ConversationNotifier(injector.get<GetConversationListUseCase>()),
    //  child: HomePage(),
    //));
  }
}
