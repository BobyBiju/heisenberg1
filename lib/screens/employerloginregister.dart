
import 'package:flutter/material.dart';
import 'package:joli/screens/employerlogin.dart';
import 'package:joli/screens/employerregistration.dart';




class EmployerLoginRegisterScreen extends StatefulWidget {

  static String id='employer_login_register_screen';
  @override
  _EmployerLoginRegisterScreenState createState() => _EmployerLoginRegisterScreenState();
}

class _EmployerLoginRegisterScreenState extends State<EmployerLoginRegisterScreen> {

  // final _auth=FirebaseAuth.instance;

  // bool showSpinner=false;
  // String email;
  // String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/employer.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
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
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child:   MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EmployerRegistrationScreen.id);
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
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
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
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child:   MaterialButton(
                  onPressed: () {
                    // setState(() {
                    //   showSpinner=true;
                    // });
                    //
                    // try {
                    //   final newUser = await _auth
                    //       .createUserWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if(newUser!=null){
                        Navigator.pushNamed(context, EmployerLoginScreen.id);
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
                    'Login',
                    style: TextStyle(color: Colors.white),
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