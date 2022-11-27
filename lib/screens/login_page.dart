import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feynman1/profile.dart';
import 'package:feynman1/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home/home_screen_layout.dart';

class login_page extends StatefulWidget {
  login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  // form key
  final _formKey = GlobalKey<FormState>();

// editing controller
  final TextEditingController emailController = new TextEditingController();

// firebase
  final _auth = FirebaseAuth.instance;

// string for displaying the error Message
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(197, 6, 6, 6),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const Text(
            'The user is already signed in please go back to homepage'),
      );
    } else {
      final emailField = TextFormField(
          autofocus: false,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Email");
            }
            // reg expression for email validation
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Please Enter a valid email");
            }
            return null;
          },
          onSaved: (value) {
            emailController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email Id",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));

      final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 15, 15, 15),
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () async {
              final email = emailController.text;

              // final password = passwordController.text;
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => password(
                              email1: emailController.text,
                            )));
              }
            },
            child: Text(
              "Next",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
      );

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(197, 6, 6, 6),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.home, size: 40, color: Colors.white),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/main/', (route) => false);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 500,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 300,
                          child: Image.asset(
                            "assets/image3.jpg",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 5),
                      emailField,
                      SizedBox(height: 25),
                      //passwordField,
                      SizedBox(height: 35),
                      loginButton,
                      SizedBox(height: 15),
                      //googleButton,
                      GoogleButton(),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Not registered yet? ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 6, 6, 6),
                                  fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Registration()));
                              },
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 177, 246),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

class password extends StatefulWidget {
  String email1;
  password({required this.email1});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  final _formKey = GlobalKey<FormState>();

// editing controller
  final TextEditingController passwordController = new TextEditingController();

// firebase
  final _auth = FirebaseAuth.instance;

// string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final user = FirebaseAuth.instance.currentUser;
    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 15, 15, 15),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            final password = passwordController.text;
            final email = widget.email1;
            if (_formKey.currentState!.validate()) {
              try {
                final userCredentail = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/main/', (route) => false);
              } on FirebaseAuthException catch (error) {
                switch (error.code) {
                  case "invalid-email":
                    errorMessage =
                        "Your email address appears to be malformed.";

                    break;
                  case "wrong-password":
                    errorMessage = "Your password is wrong.";
                    break;
                  case "user-not-found":
                    errorMessage = "User with this email doesn't exist.";
                    break;
                  case "user-disabled":
                    errorMessage = "User with this email has been disabled.";
                    break;
                  case "too-many-requests":
                    errorMessage = "Too many requests";
                    break;
                  case "operation-not-allowed":
                    errorMessage =
                        "Signing in with Email and Password is not enabled.";
                    break;
                  default:
                    errorMessage = "An undefined Error happened.";
                }
                Fluttertoast.showToast(msg: errorMessage!);
                print(error.code);
              }
            }
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(197, 6, 6, 6),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 300,
                        child: Image.asset(
                          "assets/image3.jpg",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  Future<void> _googleSignIn(context) async {
    final _auth = FirebaseAuth.instance;

// string for displaying the error Message
    String? errorMessage;
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken),
          );

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreenLayout(),
            ),
          );
        } on FirebaseException catch (error) {
          switch (error.code) {
            case "invalid-email":
              errorMessage = "Your email address appears to be malformed.";

              break;
            case "wrong-password":
              errorMessage = "Your password is wrong.";
              break;
            case "user-not-found":
              errorMessage = "User with this email doesn't exist.";
              break;
            case "user-disabled":
              errorMessage = "User with this email has been disabled.";
              break;
            case "too-many-requests":
              errorMessage = "Too many requests";
              break;
            case "operation-not-allowed":
              errorMessage =
                  "Signing in with Email and Password is not enabled.";
              break;
            default:
              errorMessage = "An undefined Error happened.";
          }
          Fluttertoast.showToast(msg: errorMessage);
          print(error.code);
        } finally {}
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreenLayout()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          _googleSignIn(context);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            color: Colors.white,
            child: Image.network(
              'data:image/png;base64,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',
              width: 40.0,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
              child: Text(
            'Sign in with google',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ]),
      ),
    );
  }
}
