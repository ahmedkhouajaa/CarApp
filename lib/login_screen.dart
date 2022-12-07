import 'package:carsapp/home_page.dart';
import 'package:carsapp/signup_screen.dart';
import 'package:carsapp/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var useremail, userpassword;
  GlobalKey<FormState> redhawk = new GlobalKey<FormState>();

 

  signin() async {
    var formdata = redhawk.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("mrigel");
      try {
        UserCredential userr = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: useremail, password: userpassword);
        return UserCredential;
        
        
      } on FirebaseAuthException catch (e) {
     //   if (e.code == 'user-not-found') {
      //    AwesomeDialog(
      //        context: context, title: 'error', body: Text("user-not-found"))
       //     ..show;

          print('No user found for that email.');
        } //else if (e.code == 'wrong-password') {
        //  AwesomeDialog(
        //      context: context,
        //      title: 'error',
        //      body: Text("Wrong password provided for that user."))
        ///    ..show;
      //    print('Wrong password provided for that user.');
        }
      
    }// else {
      //AwesomeDialog(
     //    context: context,
      //    title: 'error',
        //  body: Text("Wrong password provided for that user."))
      //  ..show;
  // }
 // }

  final number = TextEditingController();
  final password = TextEditingController();
  bool showpass = false;
  var username, passsword, email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        child: Image.asset('asset/gifs/splash_image.gif'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
             Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        width: double.infinity,
                        child: Text(
                          'WELCOME\nBACK ! ',
                          style: TextStyle(
                            fontFamily: 'Bowlby',
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.aspectRatio * 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          key: redhawk,
                          onSaved: (val) {
                            useremail = val;
                          },
                          controller: number,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            
                            labelText: 'Mobile Number',
                            suffixIcon: Icon(Icons.people),
                            floatingLabelStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.black)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.amber)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          key: redhawk , 
                          onSaved: (Value) {
                            userpassword = Value;
                          },
                          obscureText: showpass ? false : true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: password,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: showpass
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.remove_red_eye),
                            floatingLabelStyle: TextStyle(
                                color: Colors.amber,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.black)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.amber)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Checkbox(
                              splashRadius: 30,
                              side: BorderSide(width: 2),
                              activeColor: Colors.amber,
                              value: showpass,
                              onChanged: (newval) {
                                setState(() {
                                  showpass = newval!;
                                });
                              },
                            ),
                            Text(
                              'Show Password',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      showpass ? Colors.amber : Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 6),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                              onPressed: ()async {
                          var user = await signin();
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomePage())));
                          }
                        },
                              child: Text(
                                'SIGN UP>>',
                                style: TextStyle(
                                    fontSize: 22,
                                    decoration: TextDecoration.underline),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shadowColor: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.075,
                            child: ElevatedButton(
                              onPressed: logg,
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'DelaGothic'),
                              ),
                              style: ElevatedButton.styleFrom(
                                  enableFeedback: false,
                                  elevation: 10,
                                  backgroundColor: Colors.blue.withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }

  void logg() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  void sign() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
