import 'package:flutter/material.dart';
import 'SizeConfig.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return SafeArea(
      child: Scaffold(
        body: Column(
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
                      MaterialButton(
                        onPressed: () {},
                        elevation: 20,
                        child: Text("All Items"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        elevation: 20,
                        child: Text("Out of stock"),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Add New",
                style: TextStyle(fontSize: 18),
              ),
            )
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
