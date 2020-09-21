
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:googles_sign/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
   home : SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () =>   runApp(
             MaterialApp(
      debugShowCheckedModeBanner: false,
   home:  FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
                       if (snapshot.hasData){
                           FirebaseUser user = snapshot.data; // this is your user instance
                           /// is because there is user already logged
                           return HomeScreen(
                             name: user.displayName,
                           );
                        }
                         /// other way there is no user logged.
                         return LoginScreen();
             }
          ))
        )
        
    );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
            Colors.orange[800],
             Colors.orange[400],
            ]
            )
        ),
        child: Center(

          child: Text('Welcome', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500))
        ),
        )
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   bool _isLoggedIn = false;

//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

//   _login() async{
//     try{
//       await _googleSignIn.signIn();
//       setState(() {
//         _isLoggedIn = true;
//       });
//     } catch (err){
//       print(err);
//     }
//   }

//   _logout(){
//     _googleSignIn.signOut();
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//             child: _isLoggedIn
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
//                       Text(_googleSignIn.currentUser.displayName),
//                       OutlineButton( child: Text("Logout"), onPressed: (){
//                         _logout();
//                       },)
//                     ],
//                   )
//                 : Center(
//                     child: OutlineButton(
//                       child: Text("Login with Google"),
//                       onPressed: () {
//                         _login();
//                       },
//                     ),
//                   )),
//       ),
//     );
//   }
// }