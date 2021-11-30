import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(3.0, 25), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(500))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 25), child: _buildImage()),
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

  Widget _buildContainment3() {
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
                      Text("Other Items Shared",
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

  Widget _buildContainment4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Container(
            height: 60,
            width: 380,
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
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60),
                 
                      Icon(Icons.stars_outlined, color: Colors.yellow,),
                      SizedBox(width: 10),
                      Text("Pledges/Archievements/Goals",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                       SizedBox(width: 10),
                      Icon(Icons.arrow_right_alt, color: Colors.blue,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget _buildImage() {
    return Icon(Icons.add_a_photo_rounded, size: 80);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40),
                        bottomRight: const Radius.circular(40),
                      ))),
            ),
            Padding(
                padding: EdgeInsets.only(left: 175, top: 20),
                child: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Padding(padding: EdgeInsets.only(top: 20), child: _buildLogo()),
                SizedBox(height: 10),
                //_buildImage(),
                Padding(
                    padding: EdgeInsets.only(bottom: 580),
                    child: _buildContainer()),
                SizedBox(height: 10),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 240),
              child: Text(
                'Name Surname',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 172, top: 270),
              child: Row(children: [
                Icon(Icons.star, size: 15, color: Colors.yellow),
                SizedBox(width: 5),
                Text(
                  'About',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  _buildContainment2(),
                  SizedBox(width: 70),
                  _buildContainment3(),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450),
              child: _buildContainment4(),
            ),
          ],
        ),
      ),
    );
  }
}
