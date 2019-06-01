import 'package:chat_app/presentation/features/login_module/login_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/commons/const.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var injector = Injector.fromModule(module: PlaceModule());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: themeColor,
        ),
        home: LoginPage(
          title: "Universal Chat App",
        ));
    // home: ChangeNotifierProvider<ConversationNotifier>(
    //  builder: (_) => ConversationNotifier(injector.get<GetConversationListUseCase>()),
    //  child: HomePage(),
    //));
  }
}
