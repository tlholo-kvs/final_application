import 'package:final_application/screens/AuthScreen/user_profile.dart';
import 'package:flutter/material.dart';

var titleList = [
  "Notified",
  "Requster",
  "Informed",
  "Nocturne",
  "Generous",
  "Visible",
  "Updated",
  "Expect"
];

// Description List Here
var descList = [
  "The best way to stay motivated and focused. You get this badge when you enable notifications.",
  "GIFTME is about giving and receiving. Asking once in while is not a bad thing. You get this badge when you request your first donation.",
  "The best way to help more people is to attend charity events. You get this badge when you view upcoming events.",
  "The best thing about the application is that you can donate anytime of the day. You get this badge when you donate at midnight.",
  "The good is shared, especially if it is free and provides value. Share whenever you can. You get this badge when you donate.",
  "Your profile is never complete until it represent you. What better way to do that than with a profile picture. You get this badge when you upload a profile picture.",
  "Mistakes happen, we know. So keeping your profile information up to date is important. You get this badge when you update your profile information",
  "You are a true GIFTME Expect. You probably know it better than the developers. You get this badge by accumulating all the badges."
];

// Image Name List Here
var imgList = [
  "assets/images/notified.png",
  "assets/images/requester.png",
  "assets/images/informed.png",
  "assets/images/noc.png",
  "assets/images/generous.png",
  "assets/images/visible.png",
  "assets/images/updated.png",
  "assets/images/expect.png"
];

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({Key key}) : super(key: key);

  @override
  _AchievementScreenState createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfileScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              "Achievements",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(imgList.length, (index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(imgList[index],
                      fit: BoxFit.cover, width: 80, height: 80),
                ),
                const SizedBox(height: 5),
                Text(
                  titleList[index],
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildContainment2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0.0, 5), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text("0",
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  SizedBox(height: 60),
                  Text("Food Items Shared",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            height: 350,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    desc,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}