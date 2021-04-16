import 'package:flutter/material.dart';
import 'package:spare/login.dart';
import 'SizeConfig.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.7,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.7,
                    width: SizeConfig.screenWidth,
                    child: Carousel(
                      boxFit: BoxFit.contain,
                      autoplay: false,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(milliseconds: 200),
                      dotSize: b * 6,
                      dotColor: Colors.grey[300],
                      dotIncreasedColor: Colors.grey[500],
                      dotBgColor: Colors.transparent,
                      dotIncreaseSize: b * 1.5,
                      dotPosition: DotPosition.bottomCenter,
                      dotVerticalPadding: 0.0,
                      showIndicator: true,
                      indicatorBgPadding: h * 10,
                      images: [
                        ExactAssetImage("images/specs.png"),
                        ExactAssetImage("images/specs.png"),
                        ExactAssetImage("images/specs.png"),
                        ExactAssetImage("images/specs.png"),
                      ],
                    ),
                  ),
                  Positioned(
                    right: b * 20,
                    top: h * 20,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: h * 55,
                            width: b * 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Icon(MdiIcons.heart,
                                color: Colors.grey, size: b * 26),
                          ),
                        ),
                        sh(10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: h * 55,
                            width: b * 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Icon(MdiIcons.share,
                                color: Colors.grey, size: b * 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sh(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: b * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eyevy",
                    style: txtS(Colors.grey, 18, FontWeight.w500),
                  ),
                  sh(5),
                  Text(
                    "Full Rim Round, Cat-eyed Anti Glare Frame (48mm)",
                    style: txtS(Colors.grey, 16, FontWeight.w400),
                  ),
                  sh(10),
                  Row(
                    children: [
                      Text(
                        "\u{20B9} 219",
                        style: txtS(Colors.black, 20, FontWeight.w800),
                      ),
                      SizedBox(width: b * 10),
                      Text(
                        "\u{20B9}999",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: b * 16,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: b * 10),
                      Text(
                        "78% off",
                        style: txtS(Colors.green, 16, FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    elevation: 10,
                    height: h * 50,
                    minWidth: SizeConfig.screenWidth * 0.5,
                    child: Text(
                      "Add to Cart",
                      style: txtS(Colors.black, 18, FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {},
                    color: org,
                    elevation: 10,
                    height: h * 50,
                    minWidth: SizeConfig.screenWidth * 0.5,
                    child: Text(
                      "Login",
                      style: txtS(Colors.white, 18, FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 360,
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: h * SizeConfig.screenHeight / 896);
  }
}
