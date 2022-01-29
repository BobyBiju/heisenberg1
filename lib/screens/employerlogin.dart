import 'package:firebase_auth/firebase_auth.dart';

// import 'package:todoey/MyScreens/home_page.dart';
import 'package:flutter/material.dart';

// import 'package:todoey/constants.dart';
import 'package:joli/constants.dart';
import 'package:joli/screens/employeedashboard.dart';
import 'package:joli/screens/employerdashboard.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EmployerLoginScreen extends StatefulWidget {
  static String id = 'employer_login_screen';

  @override
  _EmployerLoginScreenState createState() => _EmployerLoginScreenState();
}

class _EmployerLoginScreenState extends State<EmployerLoginScreen> {
  String email;
  String password;
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F3),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 350.0,
                    child: Image.asset('images/employerr.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 38.0,
              ),
              TextField(
                cursorColor: Colors.black45,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextfieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(

                  cursorColor: Colors.black45,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextfieldDecoration.copyWith(
                    hintText: 'Enter your 6 digit password',
                    hintStyle: TextStyle(color: Colors.black),
                  )),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Color(0xFF172e4a),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, EmployerDashboard.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Color(0xFFF0F1F3),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
