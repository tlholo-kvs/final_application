import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';


class GetItem extends StatefulWidget {
  _GetItemState createState() => _GetItemState();
}

class _GetItemState extends State<GetItem> {
  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              //importing the white BoxDecoration
              color: AppColors.boxDecorationWhite,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 180),
                        child: Icon(
                          Icons.timer,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("Posted: ",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 40),
                    child: Text(
                      'Description: ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 180),
                    child: Text(
                      'Quality:   ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: _buildRating(),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        //The buildRatingIcon contains the star icon, and text and they all
        //have a size of 30
        BuildRatingIcon(),
        BuildRatingIcon(),
        BuildRatingIcon(),
        BuildRatingIcon(),
        BuildRatingIcon(),
      ],
    );
  }

  Widget _buildContainment2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  //the BoxShadow imports the boxShadowColourBlueWithOpacity
                  color: AppColors.boxShadowColourBlueWithOpacity,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0.0, 5), // changes position of shadow
                ),
              ],
              //importing the BoxDecoration of white
              color: AppColors.boxDecorationWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: _buildImage(),
          ),
        )
      ],
    );
  }

  Widget _buildImage() {
    return Icon(
      Icons.image,
      size: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                      //import of the blue BoxDecoration
                      color: AppColors.boxDecorationBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40),
                        bottomRight: const Radius.circular(40),
                      ))),
            ),
            Padding(
                padding: EdgeInsets.only(left: 165, top: 20),
                child: Text(
                  'Title',
                  style:
                      TextStyle(color: AppColors.whiteTextColor, fontSize: 35),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 530),
              child: _buildContainment2(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 280),
              child: _buildContainer(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 750, left: 260),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Request'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 40),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//The buildRating widget used in the _buildRating widget
class BuildRatingIcon extends StatelessWidget {
  const BuildRatingIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_outline,
      size: 30,
      color: AppColors.yellowIconsColor,
    );
  }
}
