import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_project/models/models/user_model.dart';

class FirebaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// CRUD operations.
  Future<QuerySnapshot<Map<String, dynamic>>> _read(String collection) async {
    return await _firestore.collection(collection).get();
  }

  Future<DocumentReference<Map<String, dynamic>>> _create({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    return await _firestore.collection(collection).add(data);
  }

  Future<void> _update({
    required String id,
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    return await _firestore.collection(collection).doc(id).update(data);
  }

  Future<void> _delete({
    required String id,
    required String collection,
  }) async {
    return await _firestore.collection(collection).doc(id).delete();
  }

  /// Users.
  Future<List<UserModel>> readUsers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> collection = await _read("users");
      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = collection.docs;
      List<UserModel> users = documents.map((user) => UserModel.fromMap(user.data())).toList();
      return users;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> createUser(UserModel model) async {
    try {
      return await _create(
        collection: "users",
        data: model.toMap(),
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> updateUser(String documentId, Map<String, dynamic> data) async {
    try {
      await _update(
        data: data,
        id: documentId,
        collection: "users",
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> deleteUser(String documentId) async {
    try {
      await _delete(
        id: documentId,
        collection: "users",
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
