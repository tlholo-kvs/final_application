import 'package:final_application/Modules/Event.dart';
import 'package:final_application/screens/event_screen.dart';
import 'package:flutter/material.dart';

class HomeEventContainer extends StatelessWidget {
  final Event event;

  const HomeEventContainer({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventScreen(
              event: event,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: 320,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(event.image),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            event.name,
            style: TextStyle(
              fontSize: 23,
              wordSpacing: 1,
            ),
          ),
          SizedBox(height: 2),
          GestureDetector(
            onTap: () async {},
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 15,
                ),
                Text(
                  event.location,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
