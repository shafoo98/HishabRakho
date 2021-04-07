import 'package:firebase_auth/firebase_auth.dart';
import 'package:hishab_rakho/models/user.dart';
import 'package:hishab_rakho/services/database.dart';

class AuthService {
  var dateAddedWallet = DateTime.now();
  var dateAddedBill = DateTime.now();
  var dateAddedBudget = DateTime.now();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create userobj based on Firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Register with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // Create a new  wallet document for the user with the uid
      await DatabaseService(uid: user.uid).addUserWalletData(
        'Example Wallet Name',
        'Describe your wallet here in details',
        0,
        dateAddedWallet,
      );

      // Create a new  bills document for the user with the uid
      await DatabaseService(uid: user.uid).addUserBillsData(
        'Name',
        'New Bill',
        0,
        dateAddedBill,
      );

      // Create a new  wallet document for the user with the uid
      await DatabaseService(uid: user.uid).addUserBudgetsData(
        'Name',
        'New Budget',
        0,
        dateAddedBudget,
      );

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
