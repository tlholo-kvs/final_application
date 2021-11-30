//Name : Event
//Purpose : The Moderator class will hold all the fields and methods neccessary
//          for storing moderator information in the database.
class Event {
  //fields for the Event class
  int _eventID;
  String _eventTitle;
  String _eventVenue;
  DateTime _eventDate;
  DateTime _eventTime;

  //getter and setter methods
  int getEventID() {
    return _eventID;
  }

  void setEventID(int evntID) {
    _eventID = evntID;
  }

  String getEventTitle() {
    return _eventTitle;
  }

  void setEventTitle(String evntTitle) {
    _eventTitle = evntTitle;
  }

  String getEventVenue() {
    return _eventVenue;
  }

  void setEventVenue(String evntVen) {
    _eventVenue = evntVen;
  }

  DateTime getEventDate() {
    return _eventDate;
  }

  void setEventDate(DateTime evntDate) {
    _eventDate = evntDate;
  }

  DateTime getEventTime() {
    return _eventTime;
  }

  void setEventTime(DateTime evntTime) {
    _eventTime = evntTime;
  }

  //Constructor for the Event class
  Event(
    this._eventID,
    this._eventTitle,
    this._eventVenue,
    this._eventDate,
    this._eventTime,
  );

  //Methods for the Event class
  void createEvent() {}
  void readEvents() {}
  void updateEvents() {}
  void deleteUpdates() {}
}
