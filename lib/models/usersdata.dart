import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kebab_ned/models/users.dart';

class Userdata {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('user');

  Future<void> setUser(Users user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'password' : user.password
      });
    } catch (e) {
      throw e;
    }
  }

  Future<Users> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return Users(
        id: id,
        email: snapshot['email'],
        password : snapshot['password'],
      );
    } catch (e) {
      throw e;
    }
  }
}
