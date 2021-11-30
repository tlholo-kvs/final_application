//Name : Request
//Purpose : The Request class will hold all the fields and methods neccessary
//          for storing a post request in the database.

class Request {
  int _requestID;
  int _userID;
  String _requestTitle;
  String _requestDescription;
  String _requestTarget;

  //getters and setters for the Request class
  int getRequestID() {
    return _requestID;
  }

  void setRequestID(int reqID) {
    _requestID = reqID;
  }

  int getUserID() {
    return _userID;
  }

  void setUserID(int usersID) {
    _userID = usersID;
  }

  String getRequestTitle() {
    return _requestTitle;
  }

  void setRequestTitle(String reqTitle) {
    _requestTitle = reqTitle;
  }

  String getRequestDescription() {
    return _requestDescription;
  }

  void setRequestDescription(String reqDesc) {
    _requestDescription = reqDesc;
  }

  String getRequestTarget() {
    return _requestTarget;
  }

  void setRequestTarget(String reqTarget) {
    _requestTarget = reqTarget;
  }

  //constructor for the Request class
  Request(
    this._requestID,
    this._userID,
    this._requestTitle,
    this._requestDescription,
    this._requestTarget,
  );

  //Methods for the Request class
  void createRequest() {}
  void readRequest() {}
  void updateRequest() {}
  void deleteRequest() {}
}
