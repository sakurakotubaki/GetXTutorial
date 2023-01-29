import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_naraun/controller/FirestoreController.dart';

// Firestoreにデータを追加するページ.
class GetApp extends StatelessWidget {
  const GetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Formに値を保存するTextEditingController.
    final TextEditingController postC = TextEditingController();
    // GetXのControllerを使用して関数を呼び出す.
    final firestoreController = Get.put(FirestoreController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: postC,
            ),
            ElevatedButton(
                onPressed: () {
                  firestoreController.addPost(postC.text);
                },
                child: Text('Post')),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('戻る'))
          ],
        ),
      ),
    );
  }
}
