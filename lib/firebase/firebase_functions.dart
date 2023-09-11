import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

//  CHECK IF USER EXISTS
Future<int> checkIdUserExists(String username) async {
  var users = await firestore.collection("users").where("username", isEqualTo: username).get();
  return users.docs.length;
}

//  CREATE USER WITH EMAIL AND PASSWORD
//  ADD USER WITH USERNAME IN FIRESTORE
Future<String> signUpAndAddUser(String email, String password, String username) async {
  try {
    String status = "failure";
    UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
    await firestore.collection("users").doc(user.user!.uid).set({
      "username": username,
    }).then(
      (value) => status = 'success',
      onError: (e) => status = "failure",
    );
    return status;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
    return "something went wrong. Try again";
  }
}

//  UPDATE CREATED USER WITH ADDITIONAL INFORMATION
Future<bool> createAccount(String fName, String lName, String phone) async {
  String userID = auth.currentUser!.uid;
  bool success = false;
  await firestore.collection("users").doc(userID).update({
    "firstName": fName,
    "lastName": lName,
    "phone": phone,
  }).then(
    (value) => {success = true},
    onError: (e) => success = false,
  );
  return success;
}

Future<String> login(String email, String password) async {
  String status = "Something went wrong! Try again later";
  await auth
      .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
      .then(
        (value) => status = "success",
        onError: (e) => status = 'faliure',
      );
  return status;
}

Future<String> logout() async {
  String status = "Something went wrong! Try again later";
  await auth.signOut().then(
        (value) => status = "success",
        onError: (e) => status = 'faliure',
      );
  return status;
}
