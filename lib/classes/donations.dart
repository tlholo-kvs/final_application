//Name : Donations
//Purpose : The Donations class will hold all the fields and methods neccessary
//          for storing a donation in the database.
class Donations {
  //Fields for the donation class
  int _donationID;
  String _name;
  String _type;
  String _quality;
  DateTime _time;

  //getters and setters
  int getDonationID() {
    return _donationID;
  }

  void setDonationID(int donID) {
    _donationID = donID;
  }

  String getName() {
    return _name;
  }

  void setName(String dName) {
    _name = dName;
  }

  String getType() {
    return _type;
  }

  void setType(String dType) {
    _type = dType;
  }

  String getQuality() {
    return _quality;
  }

  void setquality(String qty) {
    _quality = qty;
  }

  DateTime getTime() {
    return _time;
  }

  void setTime(DateTime dTime) {
    _time = dTime;
  }

  //Constructor for the donation class
  Donations(
    this._donationID,
    this._name,
    this._type,
    this._quality,
    this._time,
  );

  //CRUD methods for the Donations class
  void createDonations() {}
  void updateDonations() {}
  void retrieveDonations() {}
  void retrieveAllDonations() {}
}
