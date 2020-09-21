import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googles_sign/Login.dart';

class HomeScreen extends StatefulWidget {
  final name;

  HomeScreen({this.name});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  _signOut() async {
    await auth.signOut();

    print('kush $auth');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900],
          Colors.orange[800],
          Colors.orange[400],
        ])),
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "You are Logged in succesfully",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    " Your Name is ${widget.name}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text('Signout',
                      style: TextStyle(
                          color: Colors.orange[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
              ),
              onTap: _signOut,
            ),
          ]),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         children: <Widget>[

  //           SizedBox(
  //             height: 20,
  //           ),
  //                Container(
  //           padding: EdgeInsets.all(32),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
  //               SizedBox(height: 16,),
  //               Text(" Your Name is ${widget.name}", style: TextStyle(color: Colors.grey, ),),
  //             ],
  //           ),
  //         ),
  //             Container(
  //           padding: EdgeInsets.all(20),
  //             width: double.infinity,

  //             child: FlatButton(
  //               padding: EdgeInsets.all(16),
  //               color: Colors.blue,
  //               onPressed: _signOut,

  //              child:  Text('Logout', style: TextStyle(fontSize: 16, color: Colors.white)),
  //              )),

  //         ]
  //       ),
  //     ),
  //   );
  // }
}
