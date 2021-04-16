import 'package:flutter/material.dart';
import 'package:spare/dropDownOption.dart';
import 'SizeConfig.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

const Color blc = Color(0xff0faae2);

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              sh(30),
              Center(
                child: Text(
                  "Welcome Vendor",
                  style: txtS(Colors.grey, 22, FontWeight.w700),
                ),
              ),
              sh(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: b * 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: b * 120,
                          height: h * 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(h * 5),
                            border:
                                Border.all(color: Colors.grey, width: b * 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Text(
                            "All items",
                            style: txtS(Colors.grey, 14, FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: b * 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: b * 120,
                          height: h * 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(h * 5),
                            border: Border.all(color: blc, width: b * 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Text(
                            "Out of Stock",
                            style: txtS(Colors.grey, 14, FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    sh(30),
                    Center(
                      child: Text(
                        "Add New",
                        style: txtS(Colors.grey[800], 16, FontWeight.w400),
                      ),
                    ),
                    sh(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        img(),
                        img(),
                        img(),
                      ],
                    ),
                    sh(30),
                    Row(
                      children: [
                        Text(
                          "Category",
                          style: txtS(blc, 14, FontWeight.w500),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: h * 8, horizontal: b * 15),
                          alignment: Alignment.centerLeft,
                          width: b * 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey[500], width: b * 1.5),
                          ),
                          child: DropDownMenuBar(),
                        ),
                      ],
                    ),
                    sh(10),
                    textRow('Product Name'),
                    sh(10),
                    textRow('Price Amount'),
                    sh(10),
                    textRow('GST Amount'),
                    sh(10),
                    textRow('Delivery Charge'),
                    sh(10),
                    textRow('Offer %'),
                    sh(20),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        color: blc,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(b * 60),
                        ),
                        elevation: 1,
                        height: h * 45,
                        minWidth: b * 280,
                        child: Text(
                          "Upload",
                          style: txtS(Colors.white, 18, FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textRow(String title) {
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return Row(
      children: [
        Text(
          title,
          style: txtS(blc, 14, FontWeight.w500),
        ),
        Spacer(),
        Container(
          width: b * 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[500], width: b * 1.5),
          ),
          child: TextField(
            //controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: txtS(Colors.grey, 14, FontWeight.w400),
            decoration: dec(title, false),
          ),
        ),
      ],
    );
  }

  InputDecoration dec(String txt, bool pass) {
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: txt,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: b * 14,
        fontWeight: FontWeight.w400,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 10 / 640,
          horizontal: SizeConfig.screenWidth * 10 / 360),
    );
  }

  Widget img() {
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[500], width: b * 1.5),
      ),
      height: h * 80,
      width: b * 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[500], width: b * 1.5),
              ),
              height: h * 25,
              width: b * 65,
              child: Text(
                "Upload",
                style: txtS(Colors.grey[500], 14, FontWeight.w400),
              ),
            ),
          ),
          sh(15),
        ],
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
