//Name : Login
//Purpose : The Login class will hold all the fields and methods neccessary
//          for storing a login in the database.
class Login {
  //Login class fields
  String _loginEmail;
  int _loginPassword;

  //getter and setter methods for fields
  String getEmail() {
    return _loginEmail;
  }

  void setEmail(String lEmail) {
    _loginEmail = lEmail;
  }

  int getPassword() {
    return _loginPassword;
  }

  void setPassword(int lPasswd) {
    _loginPassword = lPasswd;
  }

  Login(this._loginEmail, this._loginPassword);

  //methods in this class
  void displayInfo() {}
  //I think the verifyLogin method should return either a boolean after checking
  //for a variable of type Profile, with parameters of email and password
  bool verifyLogin() {
    bool profileExists = false;
    return profileExists;
  }
}
