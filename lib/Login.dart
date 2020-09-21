import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googles_sign/Registration.dart';
import 'HomeScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();

  final _codeController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isShow = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> login(String email, String pass) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

//todo: Phone Authentication function
  // Future<bool> loginUser(String phone, BuildContext context) async{
  //   FirebaseAuth _auth = FirebaseAuth.instance;

  //   _auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (AuthCredential credential) async{
  //         Navigator.of(context).pop();

  //         AuthResult result = await _auth.signInWithCredential(credential);

  //         FirebaseUser user = result.user;

  //         if(user != null){
  //           Navigator.push(context, MaterialPageRoute(
  //             builder: (context) => HomeScreen(user: user,)
  //           ));
  //         }else{
  //           print("Error");
  //         }

  //         //This callback would gets called when verification is done auto maticlly
  //       },
  //       verificationFailed: (AuthException exception){
  //         print(exception);
  //       },
  //       codeSent: (String verificationId, [int forceResendingToken]){
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (context) {
  //             return AlertDialog(
  //               title: Text("Give the code?"),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   TextField(
  //                     controller: _codeController,
  //                   ),
  //                 ],
  //               ),
  //               actions: <Widget>[
  //                 FlatButton(
  //                   child: Text("Confirm"),
  //                   textColor: Colors.white,
  //                   color: Colors.blue,
  //                   onPressed: () async{
  //                     final code = _codeController.text.trim();
  //                     AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

  //                     AuthResult result = await _auth.signInWithCredential(credential);

  //                     FirebaseUser user = result.user;

  //                     if(user != null){
  //                       Navigator.push(context, MaterialPageRoute(
  //                           builder: (context) => HomeScreen(user: user,)
  //                       ));
  //                     }else{
  //                       print("Error");
  //                     }
  //                   },
  //                 )
  //               ],
  //             );
  //           }
  //         );
  //       },
  //       codeAutoRetrievalTimeout: null
  //   );
  // }
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 80),
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('SignIn',
                        style: TextStyle(color: Colors.white, fontSize: 40))
                  ])),
          SizedBox(height: 20),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, 3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Form(
                              key: formkey,
                              child: Column(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Email cannot be empty';
                                        }
                                        return null;
                                      },
                                    )),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            icon: Icon(isShow
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                isShow = !isShow;
                                              });
                                            }),
                                        hintText: 'Password',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      obscureText: !isShow,
                                      controller: _passController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Password cannot be empty';
                                        }
                                        return null;
                                      },
                                    )),
                              ]),
                            ),
                          ),
                          SizedBox(height: 20),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registration()));
                            },
                            textColor: Colors.black,
                            child: Text(
                              'SignUp?',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                              child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orange[900],
                                  ),
                                  child: Center(
                                    child: Text('SignIn',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  )),
                              onTap: () async {
                                if (formkey.currentState.validate()) {
                                  final email =
                                      _emailController.text.toString().trim();
                                  final pass =
                                      _passController.text.toString().trim();

                                  FirebaseUser user = await login(email, pass);

                                  if (user != null) {
                                    //  SharedPreferences prefs = await SharedPreferences.getInstance();
                                    //   prefs?.setBool("isLoggedIn", true);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                name: user.displayName)));
                                  } else {
                                    Toast.show('Not Registered', context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.CENTER);
                                    print('Error');
                                  }
                                }
                              }),
                        
                        ],
                      ))))
        ]),
      ),
    );
  }

  //-------------------------------------------------------phone number---------------------------------------------------------
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: SingleChildScrollView(
  //         child: Container(
  //           padding: EdgeInsets.all(32),
  //           child: Form(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Text("Login", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

  //                 SizedBox(height: 16,),

  //                 TextFormField(
  //                   decoration: InputDecoration(
  //                       enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.all(Radius.circular(8)),
  //                           borderSide: BorderSide(color: Colors.grey[200])
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.all(Radius.circular(8)),
  //                           borderSide: BorderSide(color: Colors.grey[300])
  //                       ),
  //                       filled: true,
  //                       fillColor: Colors.grey[100],
  //                       hintText: "Mobile Number"

  //                   ),
  //                   controller: _phoneController,
  //                 ),

  //                 SizedBox(height: 16,),

  //                 Container(
  //                   width: double.infinity,
  //                   child: FlatButton(
  //                     child: Text("LOGIN"),
  //                     textColor: Colors.white,
  //                     padding: EdgeInsets.all(16),
  //                     onPressed: () {
  //                       final phone = _phoneController.text.trim();

  //                       loginUser(phone, context);

  //                     },
  //                     color: Colors.blue,
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       )
  //   );
  // }
}
