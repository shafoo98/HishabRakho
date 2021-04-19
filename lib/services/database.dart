import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:hishab_rakho/models/wallet.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference walletCollection =
      FirebaseFirestore.instance.collection('Wallets');

  final CollectionReference billsCollection =
      FirebaseFirestore.instance.collection('Bills');

  final CollectionReference budgetsCollection =
      FirebaseFirestore.instance.collection('Budgets');

  Future addWalletData(String walletName, String walletDescription,
      int walletValue, var dateAdded, String uid, String walletId) async {
    dateAdded = DateTime.now();
    return await walletCollection.add({
      'walletName': walletName,
      'walletDescription': walletDescription,
      'walletValue': walletValue,
      'dateAdded': dateAdded,
      'uid': uid,
      'walletId': walletId,
    });
  }

  Future deleteWalletData(String walletId) {
    return walletCollection
        .where('walletId', isEqualTo: walletId)
        .get()
        .then((value) => value.docs.forEach((element) {
              walletCollection
                  .doc(element.id)
                  .delete()
                  .then((value) => print('Deleted'));
            }));
  }

  Future editWalletData(String walletName, String walletDescription,
      int walletValue, String walletId) {
    return walletCollection
        .where('walletId', isEqualTo: walletId)
        .get()
        .then((value) => value.docs.forEach((element) {
              walletCollection.doc(element.id).update({
                'walletName': walletName,
                'walletDescription': walletDescription,
                'walletValue': walletValue
              }).then((value) => print('Data updated'));
            }));
  }

  List<Wallet> _walletListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Wallet(
          walletName: doc.data()['walletName'] ?? 'Example Wallet',
          walletDescription:
              doc.data()['walletDescription'] ?? 'Example Description',
          walletValue: doc.data()['walletValue'] ?? 100,
          uid: doc.data()['uid'],
          walletId: doc.data()['walletId']);
    }).toList();
  }

  Stream<List<Wallet>> get wallets {
    return walletCollection
        .where('uid', isEqualTo: uid)
        .orderBy('dateAdded', descending: true)
        .snapshots()
        .map(_walletListFromSnapshot);
  }

  Future addUserBillsData(String billName, String billDescription,
      int billValue, var dateAdded, String uid, String billId) async {
    dateAdded = DateTime.now();
    return await billsCollection.add({
      'billName': billName,
      'billDescription': billDescription,
      'billValue': billValue,
      'dateAdded': dateAdded,
      'uid': uid,
      'billId': billId,
    });
  }

  Future deleteBillData(String billId) {
    return billsCollection
        .where('billId', isEqualTo: billId)
        .get()
        .then((value) => value.docs.forEach((element) {
              billsCollection
                  .doc(element.id)
                  .delete()
                  .then((value) => print('Deleted'));
            }));
  }

  Future editBillData(
      String billName, String billDescription, int billValue, String billId) {
    return billsCollection
        .where('billId', isEqualTo: billId)
        .get()
        .then((value) => value.docs.forEach((element) {
              billsCollection.doc(element.id).update({
                'billName': billName,
                'billDescription': billDescription,
                'billValue': billValue
              }).then((value) => print('Data updated'));
            }));
  }

  List<Bill> _billListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Bill(
          billName: doc.data()['billName'] ?? 'Example Expense',
          billDescription:
              doc.data()['billDescription'] ?? 'Example Description',
          billValue: doc.data()['billValue'] ?? 100,
          uid: doc.data()['uid'],
          billId: doc.data()['billId']);
    }).toList();
  }

  Stream<List<Bill>> get bills {
    return billsCollection
        .where('uid', isEqualTo: uid)
        .orderBy('dateAdded', descending: true)
        .snapshots()
        .map(_billListFromSnapshot);
  }

  Future addUserBudgetsData(String budgetName, String budgetDescription,
      int budgetValue, var dateAdded, String uid) async {
    dateAdded = DateTime.now();
    return await budgetsCollection.add({
      'budgetName': budgetName,
      'budgetDescription': budgetDescription,
      'budgetValue': budgetValue,
      'dateAdded': dateAdded,
      'uid': uid,
    });
  }

  Future deleteBudgetsData(String budgetId) {
    return budgetsCollection
        .where('budgetId', isEqualTo: budgetId)
        .get()
        .then((value) => value.docs.forEach((element) {
              billsCollection
                  .doc(element.id)
                  .delete()
                  .then((value) => print('Deleted'));
            }));
  }

  Future editBudgetsData(String budgetName, String budgetDescription,
      int budgetValue, String budgetId) {
    return budgetsCollection
        .where('budgetId', isEqualTo: budgetId)
        .get()
        .then((value) => value.docs.forEach((element) {
              billsCollection.doc(element.id).update({
                'budgetName': budgetName,
                'budgetDescription': budgetDescription,
                'budgetValue': budgetValue
              }).then((value) => print('Data updated'));
            }));
  }

  List<Budget> _budgetListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Budget(
          budgetName: doc.data()['budgetName'] ?? 'Example Expense',
          budgetDescription:
              doc.data()['budgetDescription'] ?? 'Example Description',
          budgetValue: doc.data()['budgetValue'] ?? 100,
          uid: doc.data()['uid'],
          budgetId: doc.data()['budgetId']);
    }).toList();
  }

  Stream<List<Budget>> get budgets {
    return budgetsCollection
        .where('uid', isEqualTo: uid)
        .orderBy('dateAdded', descending: true)
        .snapshots()
        .map(_budgetListFromSnapshot);
  }
}
