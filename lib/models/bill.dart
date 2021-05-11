class Bill {
  String billName;
  String billDescription;
  int billValue;
  DateTime dateTime;
  String uid;
  String billId;
  bool isShared;

  Bill(
      {this.billName,
      this.billDescription,
      this.billValue,
      this.dateTime,
      this.uid,
      this.billId,
      this.isShared});
}
