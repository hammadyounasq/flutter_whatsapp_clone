import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commenFirebaseStorageRepositry = Provider((ref) =>
    CommenFirebaseStorageRepositry(firebaseStorage: FirebaseStorage.instance));

class CommenFirebaseStorageRepositry {
  final FirebaseStorage firebaseStorage;
  CommenFirebaseStorageRepositry({required this.firebaseStorage});

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadTask = await snapshot.ref.getDownloadURL();
    return downloadTask;
  }
}
