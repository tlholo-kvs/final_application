import 'package:final_application/provider/auth_provider.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final String name = 'Name';
    final String email = '_@gmail.com';

    return Drawer(
      child: Material(
          color: Colors.blue,
          child: ListView(
            padding: padding,
            children: [
              buildHeader(
                  //urlImage: urlImage,
                  name: name,
                  email: email,
                  onClicked: () {}),
              SizedBox(height: 40),
              buildMenuItem(
                text: 'Edit Profile',
                icon: Icons.people,
              ),
              SizedBox(height: 40),
              buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
              ),
              SizedBox(height: 40),
              buildMenuItem(
                  text: 'Notifications', icon: Icons.notifications_on),
              SizedBox(height: 40),
              buildMenuItem(
                text: 'About Us',
                icon: Icons.star,
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        AuthClass().SignOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                      icon: Icon(
                        Icons.power_settings_new, color: Colors.white,
                      )),
                       SizedBox(width: 20),
                      Text('Log Out', style: TextStyle(fontSize: 15, color: Colors.white,),)
                ],
              )
            ],
          )),
    );
  }

  buildMenuItem({
    String text,
    IconData icon,
  }) {
    final color = Colors.white;

    //This ListTile needs functionality
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: () {},
    );
  }

  Widget buildHeader({
    String name,
    String email,
    VoidCallback onClicked,
    final urlImage =
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F211677%2Fimage_icon&psig=AOvVaw1iX_3EKxu8_hxD-qZl1UO9&ust=1634676426089000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCJDpza_q1PMCFQAAAAAdAAAAABAD',
    final assetsImage = 'assets/images/image.png',
  }) =>
      InkWell(
          onTap: onClicked,
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 60, backgroundImage: NetworkImage(urlImage)),
                SizedBox(width: 20),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    name,
                    style: TextStyle(
                        //importing the white text color
                        fontSize: 10,
                        color: AppColors.whiteTextColor),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                        //importing the white text color
                        fontSize: 10,
                        color: AppColors.whiteTextColor),
                  )
                ])
              ],
            ),
          ));
}
