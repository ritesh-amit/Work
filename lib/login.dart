import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spare/SizeConfig.dart';
import 'package:spare/sellItem.dart';

const Color org = Color(0xfff3aa4e);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: b * 20),
          margin: EdgeInsets.only(top: h * 30),
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(b * 20),
              topRight: Radius.circular(b * 20),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            sh(50),
            Text(
              "Login to get Started",
              style: txtS(Colors.black45, 18, FontWeight.w400),
            ),
            sh(15),
            Text(
              "Experience the all new App!",
              style: txtS(Colors.black45, 16, FontWeight.w400),
            ),
            sh(50),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: b * 1),
                ),
              ),
              width: b * 320,
              child: Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: b * 20,
                  ),
                  Container(
                    width: b * 290,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: txtS(Colors.grey, 14, FontWeight.w400),
                      decoration: dec('Email ID', false),
                    ),
                  ),
                ],
              ),
            ),
            sh(15),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: b * 1),
                ),
              ),
              width: b * 320,
              child: Row(children: [
                Icon(
                  Icons.lock,
                  color: Colors.grey,
                  size: b * 20,
                ),
                Container(
                  width: b * 290,
                  child: TextField(
                    obscureText: !isVisible,
                    controller: pwdController,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.visiblePassword,
                    style: txtS(Colors.grey, 14, FontWeight.w400),
                    decoration: dec('Password', true),
                  ),
                ),
              ]),
            ),
            sh(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Use Mobile Number",
                    style: txtS(org, 14, FontWeight.w400),
                  ),
                ),
              ],
            ),
            Spacer(),
            sh(5),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                      return SellPage();
                    }),
                    (route) => false,
                  );
                },
                color: org,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 10),
                ),
                elevation: 1,
                height: h * 50,
                minWidth: b * 320,
                child: Text(
                  "Login",
                  style: txtS(Colors.white, 18, FontWeight.w400),
                ),
              ),
            ),
            sh(10),
          ]),
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
      suffixIconConstraints:
          BoxConstraints(minWidth: b * 16, minHeight: h * 12),
      suffixIcon: pass
          ? Padding(
              padding: EdgeInsets.only(right: b * 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                  size: b * 16,
                ),
              ),
            )
          : sh(0),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 10 / 640,
          horizontal: SizeConfig.screenWidth * 10 / 360),
    );
  }

  login() async {
    String email = emailController.text;
    String pwd = pwdController.text;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd)
          .then((credential) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Successful"),
          backgroundColor: Color(0xff28797c),
          behavior: SnackBarBehavior.floating,
        ));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    } catch (e) {
      print(e);
    }
  }
}
