import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hishab_rakho/models/wallet.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Wallets Collection reference
  final CollectionReference walletCollection =
      Firestore.instance.collection('Wallets');
  //Bills Collection reference
  final CollectionReference billsCollection =
      Firestore.instance.collection('Bills');
  //Budgets Collection reference
  final CollectionReference budgetsCollection =
      Firestore.instance.collection('Budgets');

  Future addUserWalletData(String walletName, String walletDescription,
      int walletValue, var dateAddedWallet) async {
    dateAddedWallet = DateTime.now();
    return await walletCollection.document(uid).setData({
      'walletName': walletName,
      'walletDescription': walletDescription,
      'walletValue': walletValue,
      'dateAdded': dateAddedWallet,
    });
  }

  Future addUserBillsData(String billName, String billDescription,
      int billValue, var dateAddedBill) async {
    dateAddedBill = DateTime.now();
    return await billsCollection.document(uid).setData({
      'billName': billName,
      'billDescription': billDescription,
      'billValue': billValue,
      'dateAddedBill': dateAddedBill
    });
  }

  Future addUserBudgetsData(String budgetName, String budgetDescription,
      int budgetValue, var dateAddedBudget) async {
    dateAddedBudget = DateTime.now();
    return await budgetsCollection.document(uid).setData({
      'budgetName': budgetName,
      'budgetDescription': budgetDescription,
      'budgetValue': budgetValue,
      'dateAddedBill': dateAddedBudget,
    });
  }

  // Wallet list from snapshot

  List<Wallet> _walletListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Wallet(
        walletName: doc.data['walletName'] ?? '',
        walletDescription: doc.data['walletDescription'] ?? '',
        walletValue: doc.data['walletValue'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Wallet>> get wallets {
    return walletCollection.snapshots().map(_walletListFromSnapshot);
  }
}
