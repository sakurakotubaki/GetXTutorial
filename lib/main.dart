import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_naraun/ui/StreamPage.dart';
import 'package:getx_naraun/ui/get_app.dart';
import 'package:getx_naraun/ui/start_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // MaterialApp => GetMaterialAppに変更する.
      initialRoute: '/', // 名前付きルート.
      getPages: [
        GetPage(name: '/', page: () => StartPage()), // 最初の遷移.
        GetPage(name: '/GetApp', page: () => GetApp()), // GetAppの遷移.
        GetPage(
            name: '/StreamPage', page: () => StreamPage()), // StreamPageの遷移.
      ],

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
