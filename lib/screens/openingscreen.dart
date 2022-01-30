import 'package:flutter/material.dart';
import 'package:joli/screens/employeeloginregister.dart';
import 'package:joli/screens/employerloginregister.dart';
import 'package:joli/screens/employerregistration.dart';

class OpeningScreen extends StatefulWidget {
  static String id = 'opening_screen';

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  // final _auth=FirebaseAuth.instance;

  // bool showSpinner=false;
  // String email;
  // String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F1F3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 400.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            // TextField(textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            //   onChanged: (value) {
            //     email=value;
            //   },
            //   decoration: kTextfieldDecoration.copyWith(
            //       hintText: 'Enter your email'
            //   ),
            // ),
            // SizedBox(
            //   height: 8.0,
            // ),
            // TextField(textAlign: TextAlign.center,obscureText: true,
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //     onChanged: (value) {
            //       password=value;
            //     },
            //     decoration: kTextfieldDecoration.copyWith(hintText: 'Enter your 6 digit password')
            // ),
            SizedBox(
              height: 14.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Material(
                color: Color(0xFF172e4a),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, EmployerLoginRegisterScreen.id);
                    // setState(() {
                    //   showSpinner=true;
                    // });
                    //
                    // try {
                    //   final newUser = await _auth
                    //       .createUserWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if(newUser!=null){
                    //     Navigator.pushNamed(context, Home.id);
                    //   }
                    //   setState(() {
                    //     showSpinner=false;
                    //   });
                    // } catch(e)
                    // {print(e);}
                  },
                  minWidth: 200.0,
                  height: 40.0,
                  child: Text(
                    'Employer',
                    style: TextStyle(
                      color: Color(0xFFF0F1F3),
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xFF172e4a),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, EmployeeLoginRegisterScreen.id);
                    // setState(() {
                    //   showSpinner=true;
                    // });
                    //
                    // try {
                    //   final newUser = await _auth
                    //       .createUserWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if(newUser!=null){
                    //     Navigator.pushNamed(context, EmployerRegistrationScreen.id);
                    //   }
                    //   setState(() {
                    //     showSpinner=false;
                    //   });
                    // } catch(e)
                    // {print(e);}
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Employee',
                    style: TextStyle(
                      color: Color(0xFFF0F1F3),
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
