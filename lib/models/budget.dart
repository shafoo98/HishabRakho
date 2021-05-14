class Budget {
  String budgetName;
  String budgetDescription;
  int budgetValue;
  int limit;
  DateTime dateTime;
  String uid;
  String budgetId;
  bool isShared = false;

  Budget(
      {this.budgetName,
      this.budgetDescription,
      this.budgetValue,
      this.limit,
      this.dateTime,
      this.uid,
      this.budgetId,
      this.isShared});
}
