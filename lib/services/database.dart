import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hishab_rakho/models/wallet.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Users Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future addUserWalletData(String walletName, String walletDescription,
      int walletValue, var dateAdded) async {
    dateAdded = DateTime.now();
    return await userCollection.doc(uid).collection('Wallets').add({
      'walletName': walletName,
      'walletDescription': walletDescription,
      'walletValue': walletValue,
      'dateAdded': dateAdded
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
        walletName: doc.data()['walletName'] ?? '',
        walletDescription: doc.data()['walletDescription'] ?? '',
        walletValue: doc.data()['walletValue'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Wallet>> get wallets {
    return userCollection.snapshots().map(_walletListFromSnapshot);
  }
}
