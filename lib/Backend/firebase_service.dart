import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class FirebaseService {
  static Future<void> addNewsToFirestore({
    required String title,
    required String imageUrl,
    required String date,
    required String category,
    required String text,
  }) async {
    CollectionReference newsCollection = FirebaseFirestore.instance.collection('news');
    QuerySnapshot query = await newsCollection.where('title', isEqualTo: title).get();
    if (query.docs.isEmpty) {
      await newsCollection.doc(title).set({
        'title': title,
        'imageUrl': imageUrl,
        'date': date,
        'category': category,
        'text': text,
      });
    }
  }
  static Future<String> uploadImageToStorage(String title, File? imageFile, List<int>? webImage) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? 'default_user_id';
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child(userId)
          .child('$title.jpg');

      if (imageFile != null) {
        await ref.putFile(imageFile);
      } else if (webImage != null) {
        await ref.putData(Uint8List.fromList(webImage));
      } else {
        return '';
      }

      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }
}
