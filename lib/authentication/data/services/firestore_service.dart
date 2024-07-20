// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:full_firebase_authentication/authentication/data/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore firestore;
  FirestoreService(this.firestore);
  UserModel? userModel;

  Future<void> addUserProfileToDatabase(UserModel model) async {
    await firestore
        .collection('users')
        .doc()
        .set(model.toJson())
        .then((value) {});
  }
}
