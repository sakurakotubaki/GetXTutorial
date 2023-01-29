# GetXサンプル
## ナルンさん学習用サンプルコード.
Firestoreのランダムに生成されるidを使って更新と削除をやってるので、
もし業務で使うことがあれば、useridを使うのではないかと思われます。
GetXを使用する方法

GetMaterialAppでラップするとどこからでもアクセスできるようになる?

pubspec.yamlに以下のpackageを追加して下さい.

```yaml
get: ^4.6.5
firebase_core: ^2.4.1
cloud_firestore: ^4.3.1
```

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(// MaterialApp => GetMaterialAppに変更する.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
```

## 画面遷移の方法

ページ遷移するコード

```dart
ElevatedButton(
    onPressed: () {
      Get.to(GetApp());
    },
    child: Text('GetApp'))
```

前のページへ戻るボタン

```dart
ElevatedButton(
    onPressed: () {
      Get.back();
    },
    child: Text('戻る'))
```

名前付きルートの画面遷移

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // MaterialApp => GetMaterialAppに変更する.
      initialRoute: '/', // 名前付きルート.
      getPages: [
        GetPage(name: '/', page: () => StartPage()),
        GetPage(name: '/GetApp', page: () => GetApp()),
      ],

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
```

.toNamed("/名前");で、指定したルートへ画面遷移する

```dart
ElevatedButton(
    onPressed: () {
      Get.toNamed("/GetApp");
    },
    child: Text('GetApp'))
```

GetXのコントローラークラスを作成して、メソッドをグローバルに呼び出す。

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// どこからでもメソッドを呼び出せるコントローラークラス.
class FirestoreController extends GetxController {
  // Firestoreのコレクションへアクセスする変数を定義.
  final dofRef = FirebaseFirestore.instance.collection('posts');
  // DateTime.now()で現在時刻を取得.
  final now = DateTime.now();
  // Firestoreへ値を追加する.
  Future<void> addPost(String postC) async {
    await dofRef.add({
      'post': postC,
      'createdAt': Timestamp.fromDate(now),
    });
  }

  // Firestoreの値を更新する.
  Future<void> postUpdate(dynamic document, String postC) async {
    await dofRef.doc(document.id).set({
      'post': postC,
      'updatedAt': Timestamp.fromDate(now),
    });
  }

  // Firestoreの値を削除する.
  Future<void> postDelete(dynamic document) async {
    await dofRef.doc(document.id).delete();
  }
}
```