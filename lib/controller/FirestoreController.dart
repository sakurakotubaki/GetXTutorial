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
