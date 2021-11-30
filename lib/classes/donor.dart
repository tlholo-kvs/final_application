//Name : Donor
//Purpose : The Donor class will hold all the fields and methods neccessary
//          for storing a donor in the database.
class Donor {
  //fields for the donor class
  String _description; 
  int _phoneNumber;

  //getter and setter methods for the class
  String getDescription() {
    return _description;
  }

  void setDescription(String desc) {
    _description = desc;
  }

  int getPhoneNumber() {
    return _phoneNumber;
  }

  void setPhoneNumber(int phoneNum) {
    _phoneNumber = phoneNum;
  }

  //Constructor for the Donor class
  Donor(
    this._description,
    this._phoneNumber,
  );
}
