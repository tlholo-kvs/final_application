//Name : CompletedTransactions
//Purpose : The CompletedTransactions class will hold information about
//          completed donation transactions, which in this case is a
//          donated item that was accepted.

class CompletedTransactions {
  //fields in the CompletedTransactions class
  int _donationID;
  String _itemName;
  String _itemType;
  String _itemQuality;
  DateTime _dateCompleted;
  DateTime _timeCompleted;

  //getters and setters
  int getDonationID() {
    return _donationID;
  }

  void setDonationID(int donID) {
    _donationID = donID;
  }

  String getItemName() {
    return _itemName;
  }

  void setItemName(String iName) {
    _itemName = iName;
  }

  String getItemQuality() {
    return _itemQuality;
  }

  void setItemquality(String iQlty) {
    _itemQuality = iQlty;
  }

  String getItemType() {
    return _itemType;
  }

  void setItemType(String itmType) {
    _itemType = itmType;
  }

  DateTime getDateCompleted() {
    return _dateCompleted;
  }

  void setDateCompleted(DateTime dateCmplted) {
    _dateCompleted = dateCmplted;
  }

  DateTime getTimeCompleted() {
    return _timeCompleted;
  }

  void setTimeCompleted(DateTime timeCmplted) {
    _timeCompleted = timeCmplted;
  }

  //Constructors for the CompletedTransactions class
  CompletedTransactions(
    this._donationID,
    this._itemName,
    this._itemType,
    this._itemQuality,
    this._dateCompleted,
    this._timeCompleted,
  );
}
