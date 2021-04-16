import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spare/SizeConfig.dart';
import 'package:spare/homePage.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isVisiblePass = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: b * 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: txtS(Colors.grey, 26, FontWeight.w800),
            ),
            sh(30),
            Container(
              width: b * 345,
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(b * 70),
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: txtS(Colors.grey, 16, FontWeight.w500),
                decoration: dec('Email ID', false),
              ),
            ),
            sh(20),
            Container(
              width: b * 345,
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(b * 70),
              ),
              child: TextField(
                controller: pwdController,
                obscuringCharacter: '*',
                obscureText: isVisiblePass,
                keyboardType: TextInputType.visiblePassword,
                style: txtS(Colors.grey, 16, FontWeight.w500),
                decoration: dec('Password', true),
              ),
            ),
            sh(30),
            Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }), (route) => false);
                },
                color: Color(0xff0faae2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(b * 40),
                ),
                elevation: 0,
                minWidth: b * 345,
                height: h * 50,
                child: Text(
                  "Login",
                  style: txtS(Colors.white, 20, FontWeight.w500),
                ),
              ),
            ),
            sh(90),
            Text(
              "Don't have an account?",
              style: txtS(Colors.grey[700], 16, FontWeight.w400),
            ),
            sh(5),
            InkWell(
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xff0faae2),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
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
      fontSize: SizeConfig.screenWidth * siz / 414,
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
        fontSize: SizeConfig.screenWidth * 16 / 360,
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
                    isVisiblePass = !isVisiblePass;
                  });
                },
                child: Icon(
                  isVisiblePass ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                  size: b * 16,
                ),
              ),
            )
          : sh(0),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * 15 / 640,
          horizontal: SizeConfig.screenWidth * 20 / 360),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: h * SizeConfig.screenHeight / 896);
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
