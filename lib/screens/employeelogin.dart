import 'package:firebase_auth/firebase_auth.dart';
// import 'package:todoey/MyScreens/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:todoey/constants.dart';
import 'package:joli/constants.dart';
import 'package:joli/screens/employeedashboard.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class EmployeeLoginScreen extends StatefulWidget {
  static String id='employee_login_screen';
  @override
  _EmployeeLoginScreenState createState() => _EmployeeLoginScreenState();
}

class _EmployeeLoginScreenState extends State<EmployeeLoginScreen> {
  String email;
  String password;
  String _name;
  bool showSpinner=false;

  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/laborer.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),

                onChanged: (value) {
                  _name=value;
                },
                decoration:kTextfieldDecoration.copyWith(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),

                onChanged: (value) {
                  email=value;
                },
                decoration:kTextfieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(textAlign: TextAlign.center,obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  password=value;
                },
                decoration: kTextfieldDecoration.copyWith(hintText: 'Enter your 6 digit password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(

                    onPressed: () async{
                      setState(() {
                        showSpinner=true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmployeeDashboard(_name),));
                        }
                        setState(() {
                          showSpinner=false;
                        });
                      } catch(e)
                      {print(e);}
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',

                    ),
                  )
                  ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
