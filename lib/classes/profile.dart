//Name : Profile
//Purpose : The Profile class will hold all the fields and methods neccessary
//          for storing a user profile in the database.
class Profile {
//fields for the Profile class
  int _userID;
  String _userFirstName;
  String _userLastName;
  String _userEmail;
  int _userPassword;
  String _description;

  //getter and setter methods for the fields
  int getUserID() {
    return _userID;
  }

  void setUserID(int uID) {
    _userID = uID;
  }

  String getFirstName() {
    return _userFirstName;
  }

  void setFirstName(String fName) {
    _userFirstName = fName;
  }

  String getLastName() {
    return _userLastName;
  }

  void setLastName(String lName) {
    _userLastName = lName;
  }

  String getEmail() {
    return _userEmail;
  }

  void setEmail(String userEmail) {
    _userEmail = userEmail;
  }

  int getPassword() {
    return _userPassword;
  }

  void setPassword(int userPassword) {
    _userPassword = userPassword;
  }

  String getDescription() {
    return _description;
  }

  void setDescription(String desc) {
    _description = desc;
  }

  Profile(this._userID, this._userFirstName, this._userLastName,
      this._userEmail, this._userPassword, this._description);

  //Methods for the Profile class
  void updateProfile() {}
  void viewDonations() {}
}
