import 'package:final_application/provider/db_service_events.dart';
import 'package:final_application/screens/AuthScreen/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCreation extends StatefulWidget {
  EventCreation({Key key}) : super(key: key);

  _EventCreationState createState() => _EventCreationState();
}

class _EventCreationState extends State<EventCreation> {
  GlobalKey<FormState> key = GlobalKey();

  TextEditingController _eventTitle = TextEditingController();
  TextEditingController _eventVenue = TextEditingController();
  TextEditingController _aboutEvent = TextEditingController();

  String time = "?";
  String selectTime = "?";

  DateTime _eventDate;

   

  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePicker(BuildContext context) async {

      final TimeOfDay t = await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if(t != null) {
        setState(() {
          
          selectTime = t.format(context);
        });
      }
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Text(
              "Events",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                32,
              ),
              bottomRight: Radius.circular(
                32,
              ),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Create Event", style: TextStyle(fontSize: 20, color: Colors.black),),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _eventTitle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Event Title',
                    prefixIcon: Icon(Icons.sticky_note_2),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _eventVenue,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Event Venue',
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(time),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () async {

                      
                      _eventDate = await showDatePicker(
                          context: context,
                          initialDate: _eventDate == null ? DateTime.now() : _eventDate,
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025));

                          setState(() {
                        
                        time = DateFormat('dd-MM-yy').format(_eventDate);

                      });

                    },
                    child: Text("Select Event Date")),
                     SizedBox(
                  height: 60,
                ),
                Text(selectTime),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: () {
                  _openTimePicker(context);
                }, child: Text('Select Event Time')),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _aboutEvent,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'About Event',
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 260),
                  child: ElevatedButton(onPressed: () {

                    
                    
                    // imagePickerMethod();

                    //Save data to database

                    DbHelper4()
                        .add(
                            eventTitle: _eventTitle.text.trim(),
                            eventVenue: _eventVenue.text.trim(),
                            eventDate: time.trim(),
                            eventTime: selectTime.trim(),
                            aboutEvent: _aboutEvent.text.trim())
                            
                        .then((value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));


                    });

                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Admin()));
                  



                  }, child: Text("Create Event")),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
