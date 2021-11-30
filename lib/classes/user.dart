//Name : User
//Purpose : The User class will hold all the fields and methods neccessary
//          for storing a user in the database.
class User {
  //fields for the User class
  int _userID;
  String _userFirstName;
  String _userLastName;
  String _userEmail;
  int _userPassword;

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

  void setPassword(int uPassword) {
    _userPassword = uPassword;
  }

  //The User class's constructor
  User(this._userID, this._userFirstName, this._userLastName, this._userEmail,
      this._userPassword);

  //CRUD methods for the User class
  void create() {}
  void retrieve() {}
  void update() {}
  void delete() {}
}
