//Name : SubmitDonation
//Purpose : The SubmitDonation class will hold all the fields and methods neccessary
//          for storing a post request in the database.

class SubmitDonation {
  //fields for the class
  int _userID;
  String _donationName;
  int _donationID;

  //getters and setters for the class
  int getUserID() {
    return _userID;
  }

  void setUserID(int usersID) {
    _userID = usersID;
  }

  String getDonationName() {
    return _donationName;
  }

  void setDonationName(String donName) {
    _donationName = donName;
  }

  int getDonationID() {
    return _donationID;
  }

  void setDonationID(int donID) {
    _donationID = donID;
  }

  //Constructor for the SubmitDonation class
  SubmitDonation(
    this._userID,
    this._donationName,
    this._donationID,
  );
}
