import 'package:final_application/screens/AuthScreen/create_item.dart';
import 'package:final_application/screens/AuthScreen/food_items.dart';
import 'package:final_application/screens/AuthScreen/non_food_items.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';


class Donor extends StatefulWidget {
  _DonorState createState() => _DonorState();
}

class _DonorState extends State<Donor> {
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
                  //This boxShadow uses the Blue color with opacity
                  color: AppColors.boxShadowColourBlueWithOpacity,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(3.0, 25), // changes position of shadow
                ),
              ],
              //importing the white BoxDecoration
              color: AppColors.boxDecorationWhite,
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(500),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: _buildImage(),
                  ),
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

  Widget _buildImage() {
    return Image.asset('assets/images/donate.png',
        width: 100, height: 100, fit: BoxFit.fill);
  }

  Widget _buildContainment4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        //importing the blue BoxShadow with opacity
                        color: AppColors.boxShadowColourBlueWithOpacity,
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0.0, 5), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Image.asset('assets/images/food.jpg')],
                ),
              ),
            ),
            onTap: () {
               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateItem()));
            })
      ],
    );
  }

  Widget _buildContainment3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        //importing the blue BoxShadow with opacity
                        color: AppColors.boxShadowColourBlueWithOpacity,
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0.0, 5), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Image.asset('assets/images/clothes.png')],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateItem()));
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                      //importing the blue boxdecoration color
                      color: AppColors.boxDecorationBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40),
                        bottomRight: const Radius.circular(40),
                      ))),
            ),
            Padding(
                padding: EdgeInsets.only(left: 160, top: 20),
                child: Text(
                  'Donor',
                  style: TextStyle(
                    //importing the white text color
                    color: AppColors.whiteTextColor,
                    fontSize: 35,
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(bottom: 540),
                    child: _buildContainer()),
                SizedBox(height: 10),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 340, left: 100),
              child: Text(
                'Choose Item Type',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 210),
              child: _buildContainment4(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 550),
              child: Text(
                'Food Items',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 135, top: 580),
              child: Text(
                'Nutritious substances people can consume or drink',
                style: TextStyle(fontSize: 5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 440),
              child: _buildContainment3(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 780),
              child: Text(
                'Other Items',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 145, top: 810),
              child: Text(
                'Any item that can provide essential function',
                style: TextStyle(fontSize: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
