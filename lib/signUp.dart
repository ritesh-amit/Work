import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spare/SizeConfig.dart';
import 'package:spare/sellItem.dart';
const Color org = Color(0xfff3aa4e);

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isVisiblePass = false;
  bool isVisibleConfirmPass = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 360;
    var h = SizeConfig.screenHeight / 640;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            sh(70),
            Text(
              "Register in to get started",
              style: txtS(Colors.black45, 18, FontWeight.w400),
            ),
            sh(15),
            Text(
              "Experience the all new App!",
              style: txtS(Colors.black45, 16, FontWeight.w400),
            ),
            sh(60),
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
                    Icons.person_outline,
                    color: Colors.grey,
                    size: b * 20,
                  ),
                  Container(
                    width: b * 290,
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      style: txtS(Colors.grey, 14, FontWeight.w400),
                      decoration: dec('Name'),
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
                      decoration: dec('Email ID'),
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
              child: Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.grey,
                    size: b * 20,
                  ),
                  Container(
                    width: b * 290,
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      style: txtS(Colors.grey, 14, FontWeight.w400),
                      decoration: dec('Mobile Number'),
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
                    obscureText: !isVisiblePass,
                    controller: pwdController,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.visiblePassword,
                    style: txtS(Colors.grey, 14, FontWeight.w400),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: b * 14,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: b * 16, minHeight: h * 12),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: b * 15),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isVisiblePass = !isVisiblePass;
                            });
                          },
                          child: Icon(
                            isVisiblePass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                            size: b * 16,
                          ),
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: h * 10, horizontal: b * 10),
                    ),
                  ),
                ),
              ]),
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
                    obscureText: !isVisibleConfirmPass,
                    controller: confirmPassController,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.visiblePassword,
                    style: txtS(Colors.grey, 14, FontWeight.w400),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: b * 14,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: b * 16, minHeight: h * 12),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: b * 15),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isVisibleConfirmPass = !isVisibleConfirmPass;
                            });
                          },
                          child: Icon(
                            isVisibleConfirmPass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                            size: b * 16,
                          ),
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: h * 10, horizontal: b * 10),
                    ),
                  ),
                ),
              ]),
            ),
            Spacer(),
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
                elevation: 5,
                height: h * 50,
                minWidth: b * 320,
                child: Text(
                  "Register",
                  style: txtS(Colors.white, 18, FontWeight.w400),
                ),
                textColor: Colors.white,
              ),
            ),
            sh(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: txtS(Colors.grey, 14, FontWeight.w400),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    " Login",
                    style: txtS(Colors.black, 14, FontWeight.w400),
                  ),
                ),
              ],
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

  InputDecoration dec(String txt) {
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
