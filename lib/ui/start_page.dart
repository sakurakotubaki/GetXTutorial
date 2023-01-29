import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// 名前付きルートで画面遷移するページ.
class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StartPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/GetApp");
                },
                child: Text('GetApp')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/StreamPage');
                },
                child: Text('StreamPage')),
          ],
        ),
      ),
    );
  }
}
