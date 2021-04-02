import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection reference
  final CollectionReference walletCollection =
      Firestore.instance.collection('Wallets');
  //Collection reference
  final CollectionReference billsCollection =
      Firestore.instance.collection('Bills');
  //Collection reference
  final CollectionReference budgetsCollection =
      Firestore.instance.collection('Budgets');

  Future updateUserWalletData(String walletName, String walletDescription,
      int walletValue, var dateAddedWallet) async {
    dateAddedWallet = DateTime.now();
    return await walletCollection.document(uid).setData({
      'walletName': walletName,
      'walletDescription': walletDescription,
      'walletValue': walletValue,
      'dateAdded': dateAddedWallet,
    });
  }

  Future updateUserBillsData(String billName, String billDescription,
      int billValue, var dateAddedBill) async {
    dateAddedBill = DateTime.now();
    return await billsCollection.document(uid).setData({
      'billName': billName,
      'billDescription': billDescription,
      'billValue': billValue,
      'dateAddedBill': dateAddedBill
    });
  }

  Future updateUserBudgetsData(String budgetName, String budgetDescription,
      int budgetValue, var dateAddedBudget) async {
    dateAddedBudget = DateTime.now();
    return await budgetsCollection.document(uid).setData({
      'budgetName': budgetName,
      'budgetDescription': budgetDescription,
      'budgetValue': budgetValue,
      'dateAddedBill': dateAddedBudget,
    });
  }
}
