import 'package:flutter/material.dart';
import 'package:joli/screens/Mapshow.dart';
import 'package:joli/screens/Payment.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:joli/screens/employeedashboard.dart';
import 'dart:convert';

class ContactEmployee extends StatefulWidget {
  static String id = 'contact_employee_screen';
final DocumentSnapshot employee;
ContactEmployee(this.employee);

  // ContactEmployee(this.phoneNo);



  @override
  _ContactEmployeeState createState() => _ContactEmployeeState();
}

class _ContactEmployeeState extends State<ContactEmployee> {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _CollectionReference = _firestore
      .collection("employees")
      .doc("employeesinfo")
      .collection("profile");
  static final _DocumentReference = _CollectionReference.doc('profileinfo');

  String name, phoneNo, district, profession;
  @override
  void initState() {
    // TODO: implement initState
    name =widget.employee["Name"];
    phoneNo=widget.employee["PhoneNo"];
    super.initState();
  }
  _makingPhoneCall() async {
    String url = 'tel:$phoneNo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const SizedBox(height: 10.0),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Contact Employee",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 100,
              width: 500,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 2),
              ),
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 10.0),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(name,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              height: 75,
              width: 500,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey,width: 2),
              ),

            ),
            const SizedBox(height: 10.0),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.employee["PhoneNo"],
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              height: 75,
              width: 500,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey,width: 2),
              ),

            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.green,
                  onPressed: _makingPhoneCall,
                  child: Text('Call',
                  style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){
                    navigateToPayment(widget.employee);
                  },
                  child: Text("Pay'em",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mapshow(widget.employee['Latitude'],widget.employee['Longitude'])));
                  },
                  child: Text("Map'em",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),



            // ElevatedButton.icon(
            //   style: ButtonStyle(
            //
            //   ),
            //   onPressed: (){
            //
            //
            //   },
            //   icon: const Icon(Icons.electrical_services),
            //   label: const Text('Electrician'),
            // ),

          ]),
        ),
      ),
    );
  }

  navigateToPayment( DocumentSnapshot employee) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Payment()));
  }
}