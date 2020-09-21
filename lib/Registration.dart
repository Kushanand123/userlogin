import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'Login.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _nameController = TextEditingController();

final formkey = GlobalKey<FormState>();
  bool isShow = false;
  Future<bool> registerUser(String email, String pass, String name) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    FirebaseUser user = result.user;
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = name;
    user.updateProfile(info);
    return true;
    }catch(e){
      print(e);
      return false;
    }
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
         SizedBox(height: 80),
         Padding(padding: EdgeInsets.all(20),
             child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('SignUp', style: TextStyle(
              color: Colors.white, fontSize: 40
            ))
          ])
         ),
         SizedBox(height:20),
         Expanded(
           child: Container(
             decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
             ),
             child: Padding(padding: EdgeInsets.all(20),
             child: ListView(
               children:<Widget>[
                 Container(
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                       color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [BoxShadow(
                    color: Color.fromRGBO(225, 95, 27, 3),
                    blurRadius: 20,
                    offset: Offset(0, 10)
                     )] 
                   ),
                   child: Form(
                        key: formkey,
                        child: Column(
                       children:<Widget>[
                         Container(
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             border: Border(bottom: BorderSide(color: Colors.grey[200]))
                           ),
                           child: TextFormField(
                             decoration: InputDecoration(
                             hintText: 'Email',
                             hintStyle: TextStyle(color: Colors.grey),
                             border: InputBorder.none,
                             ),
                            controller: _emailController,
                                 validator: (value) {
                          if (value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          return null;
                        },
                           )
                         ),
                           Container(
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             border: Border(bottom: BorderSide(color: Colors.grey[200]))
                           ),
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
                             hintStyle: TextStyle(color: Colors.grey),
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
                           )
                         ),
                           Container(
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             border: Border(bottom: BorderSide(color: Colors.grey[200]))
                           ),
                           child: TextFormField(
                             decoration: InputDecoration(
                             hintText: 'User Name',
                             hintStyle: TextStyle(color: Colors.grey),
                             border: InputBorder.none,
                             ),
                            controller: _nameController,
                                 validator: (value) {
                          if (value.isEmpty) {
                            return 'Name cannot be empty';
                          }
                          return null;
                        },
                           )
                         ),
                       ]
                     ),
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
                       child:Text('Signup', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) ,)
                   ),
                    onTap: () async {
                            if (formkey.currentState.validate()) {
              final email = _emailController.text.toString().trim();
              final pass = _passController.text.toString().trim();
              final name = _nameController.text.toString().trim();

              bool result = await registerUser(email, pass, name);
              if(result){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
              }else{
                print('Error');
              }  
                   }}
                 ),
 
               ],
             )
             )
           ))
          ]
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------------
// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //            iconTheme: IconThemeData(
  //      color: Colors.blue
  // ),
  //         elevation: 1.5,
  //       backgroundColor: Colors.white,
  //       title: Text('Registor User', style: TextStyle(color: Colors.blue))
  //     ),
  //     body: SafeArea(
  //     child: SingleChildScrollView(
  //       child: Container(
  //         padding: EdgeInsets.all(32),
  //         child: Form(
  //           key: formkey,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //           Text('Registration', style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),
  //           SizedBox(
  //             height: 18
  //           ),
  //           TextFormField(
  //             controller: _emailController,
  //             decoration: InputDecoration(
  //             hintText: 'Email'
  //             ),
  //              validator: (value) {
  //               if (value.isEmpty) {
  //              return 'Email cannot be empty';
  //                }
  //             return null;
  //                       },
  //           ),
  //            SizedBox(
  //             height: 18
  //           ),
  //           TextFormField(
  //             controller: _passController,
  //             decoration: InputDecoration(
  //             hintText: 'Password'
  //             ),
  //              validator: (value) {
  //                         if (value.isEmpty) {
  //                           return 'Password cannot be empty';
  //                         }
  //                         return null;
  //                       },
  //           ),
  //            SizedBox(
  //             height: 18
  //           ),
  //           TextFormField(
  //             controller: _nameController,
  //             decoration: InputDecoration(
  //             hintText: 'Name'
  //             ),
  //              validator: (value) {
  //              if (value.isEmpty) {
  //            return 'Name cannot be empty';
  //                }
  //             return null;
  //               },
  //           ),
  //            SizedBox(
  //             height: 18
  //           ),
  //           Container(
  //             width: double.infinity,
          
  //             child: FlatButton(
  //               padding: EdgeInsets.all(16),
  //               color: Colors.blue,
  //               onPressed: () async {
  //              if (formkey.currentState.validate()) {
  //             final email = _emailController.text.toString().trim();
  //             final pass = _passController.text.toString().trim();
  //             final name = _nameController.text.toString().trim();

  //             bool result = await registerUser(email, pass, name);
  //             if(result){
  //               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
  //             }else{
  //               print('Error');
  //             }}
  //               },
  //              child: Text('Submit', style: TextStyle(fontSize: 16, color: Colors.white),
  //              )),
  //           )


  //           ]
  //         ))
  //       )
  //     )
  //     ),
  //   );
  // }