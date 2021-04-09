import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hishab_rakho/models/wallet.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Users Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference walletCollection =
      FirebaseFirestore.instance.collection('Wallets');

  Future addUser(String email, String password) {
    return userCollection.add({
      'email': email,
      'password': password,
    });
  }

  Future addWalletData(String walletName, String walletDescription,
      int walletValue, var dateAdded, String uid) async {
    dateAdded = DateTime.now();
    return await walletCollection.add({
      'walletName': walletName,
      'walletDescription': walletDescription,
      'walletValue': walletValue,
      'dateAdded': dateAdded,
      'uid': uid,
    });
  }

  Future addUserBillsData(String billName, String billDescription,
      int billValue, var dateAdded) async {
    dateAdded = DateTime.now();
    return await userCollection.doc(uid).collection('Bills').add({
      'walletName': billName,
      'walletDescription': billDescription,
      'walletValue': billValue,
      'dateAdded': dateAdded
    });
  }

  Future addUserBudgetsData(String budgetName, String budgetDescription,
      int budgetValue, var dateAdded) async {
    dateAdded = DateTime.now();
    return await userCollection.doc(uid).collection('Budgets').add({
      'walletName': budgetName,
      'walletDescription': budgetDescription,
      'walletValue': budgetValue,
      'dateAdded': dateAdded
    });
  }

  List<Wallet> _walletListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Wallet(
          walletName: doc.data()['walletName'] ?? 'Example Wallet',
          walletDescription:
              doc.data()['walletDescription'] ?? 'Example Description',
          walletValue: doc.data()['walletValue'] ?? 100,
          uid: doc.data()['uid']);
    }).toList();
  }

  Stream<List<Wallet>> get wallets {
    return walletCollection
        .where('uid', isEqualTo: uid)
        .orderBy('dateAdded', descending: true)
        .snapshots()
        .map(_walletListFromSnapshot);
  }
}
