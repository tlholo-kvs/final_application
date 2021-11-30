//Name : Moderator
//Purpose : The Moderator class will hold all the fields and methods neccessary
//          for storing moderator information in the database.

class Moderator {
  //The moderator class has only one field, being moderatorID
  int _moderatorID;

  //getter and setter methods for moderatorID
  int getModeratorID() {
    return _moderatorID;
  }

  void setModeratorID(int modID) {
    _moderatorID = modID;
  }

  //constructor for the Moderator class
  Moderator(this._moderatorID);
}
