import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feynman1/constant/user_model.dart';
import 'package:feynman1/screens/body/contact/contact_web.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class Registration extends StatefulWidget {
  Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? errorMessage;
  var plan = null;
  var plan1 = null;
  var valid = null;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final institutionEiditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();
  final cardnumberEditingController = new TextEditingController();
  final cardnameEditingController = new TextEditingController();
  final cvvEditingController = new TextEditingController();
  final expiryEditingController = new TextEditingController();
  //final ageEditingController = new TextEditingController();
  late final phonenumberEditingController = new TextEditingController();
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
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
            icon: Icon(Icons.home, size: 40, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const Center(
          child: Text(
              'The user is already logged in please click home button to go back to home page'),
        ),
      );
    } else {
      final firstNameField = TextFormField(
          autofocus: false,
          controller: firstNameEditingController,
          keyboardType: TextInputType.emailAddress,
          //validator: {} {},
          validator: (value) {
            RegExp regex = new RegExp(r'^.{3,}$');
            if (value!.isEmpty) {
              return ("Enter First Name(Should be greater than 3 characters");
            }
            if (!regex.hasMatch(value)) {
              return ("Please Enter a Valid First Name");
            }
            return null;
          },
          onSaved: (value) {
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "First Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));

      final secondNameField = TextFormField(
          autofocus: false,
          controller: secondNameEditingController,
          keyboardType: TextInputType.emailAddress,
          //validator: {} {},
          validator: (value) {
            RegExp regex = new RegExp(r'^.{3,}$');
            if (value!.isEmpty) {
              return ("Enter Second Name(Should be greater than 3 characters");
            }
            if (!regex.hasMatch(value)) {
              return ("Please Enter a Valid Second Name");
            }
            return null;
          },
          onSaved: (value) {
            secondNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Last Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));

      final institutionField = TextFormField(
          autofocus: false,
          controller: institutionEiditingController,
          keyboardType: TextInputType.number,
          onSaved: (value) {
            institutionEiditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.maps_home_work),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Name Of Instution/Organization",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      final phonenumberField = TextFormField(
          autofocus: false,
          controller: phonenumberEditingController,
          keyboardType: TextInputType.phone,
          //validator: {} {},
          validator: (value) {
            RegExp regex = new RegExp(r'^.{10,}$');
            if (value!.isEmpty) {
              return ("Enter phone number");
            }
            if (!regex.hasMatch(value)) {
              return ("Please Enter a Valid phone number");
            }
            return null;
          },
          onSaved: (value) {
            phonenumberEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "+91",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      final emailField = TextFormField(
          autofocus: false,
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          //validator: {} {},
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
            emailEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));

      final passwordField = TextFormField(
          autofocus: false,
          controller: passwordEditingController,
          obscureText: true,
          //validator: {} {},
          validator: (value) {
            RegExp regex = new RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return ("Please Enter Your Password");
            }
            if (!regex.hasMatch(value)) {
              return ("Please Enter a Valid Password");
            }
          },
          onSaved: (value) {
            passwordEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      final confirmpasswordField = TextFormField(
          autofocus: false,
          controller: confirmpasswordEditingController,
          obscureText: true,
          //validator: {} {},
          validator: (value) {
            if (confirmpasswordEditingController.text.length > 6 &&
                passwordEditingController.text !=
                    confirmpasswordEditingController) {
              return "Password dont match";
            }
          },
          onSaved: (value) {
            confirmpasswordEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.vpn_key),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Confirm Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      final cardnameField = TextFormField(
          autofocus: false,
          controller: cardnameEditingController,
          keyboardType: TextInputType.number,
          onSaved: (value) {
            cardnameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            //prefixIcon: Icon(Icons.),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Name On Card",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      final cardnumberField = TextFormField(
          autofocus: false,
          controller: cardnumberEditingController,
          keyboardType: TextInputType.number,
          // obscureText: true,
          //validator: {} {},
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(19),
          ],
          onSaved: (value) {
            cardnumberEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.numbers),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Card Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      final cvvField =
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            width: 80,
            child: TextFormField(
                autofocus: false,
                controller: cvvEditingController,
                keyboardType: TextInputType.number,
                // obscureText: true,
                //validator: {} {},
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  // Limit the input
                  LengthLimitingTextInputFormatter(4),
                ],
                onSaved: (value) {
                  cvvEditingController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.numbers),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "CVV",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ))),
        SizedBox(
          width: 180,
        ),
        SizedBox(
          child: Text(
            "Expiry",
            style: TextStyle(
              color: Color.fromARGB(255, 118, 117, 117),
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 100,
            child: TextFormField(
                autofocus: false,
                controller: expiryEditingController,
                keyboardType: TextInputType.number,
                // obscureText: true,
                //validator: {} {},
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                ],
                onSaved: (value) {
                  expiryEditingController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.numbers),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "MM/YY",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ))),
      ]);

      final signupButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 12, 12, 12),
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () async {
              final email = emailEditingController.text;
              final password = passwordEditingController.text;
              if (_formKey.currentState!.validate()) {
                try {
                  final userCredentail = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) => {postDetailsToFirestore()})
                      .catchError((e) {
                    Fluttertoast.showToast(msg: e!.message);
                  });
                  /* Navigator.of(context)
                      .pushNamedAndRemoveUntil('/main/', (route) => false);*/
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
            child: Text("Signup",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
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
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height: 45),
                    secondNameField,
                    SizedBox(height: 45),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MSHCheckbox(
                                  size: 20,
                                  value: isChecked6,
                                  checkedColor: Colors.blue,
                                  style: MSHCheckboxStyle.stroke,
                                  onChanged: (selected) {
                                    setState(() {
                                      isChecked6 = selected;
                                      plan1 = "Organization";
                                    });
                                  },
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Organization',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 118, 117, 117),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MSHCheckbox(
                                  size: 20,
                                  value: isChecked5,
                                  checkedColor: Colors.blue,
                                  style: MSHCheckboxStyle.stroke,
                                  onChanged: (selected) {
                                    setState(() {
                                      isChecked5 = selected;
                                      plan1 = "Institution";
                                    });
                                  },
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Institution',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 118, 117, 117),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            width: 20,
                          ),
                        ])),
                    SizedBox(height: 45),
                    institutionField,
                    //ageField,

                    SizedBox(height: 45),
                    phonenumberField,
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 45),
                    passwordField,
                    SizedBox(height: 45),
                    confirmpasswordField,
                    SizedBox(height: 45),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.all(15.0),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 135, 135, 136)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Plans",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 118, 117, 117),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ]),
                          SizedBox(
                            width: 130,
                            //height: 30,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MSHCheckbox(
                                  size: 20,
                                  value: isChecked,
                                  checkedColor: Colors.blue,
                                  style: MSHCheckboxStyle.stroke,
                                  onChanged: (selected) {
                                    setState(() {
                                      isChecked = selected;
                                      plan = "Basic";
                                      valid = "9 December 2022";
                                    });
                                  },
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Basic',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 118, 117, 117),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MSHCheckbox(
                                  size: 20,
                                  value: isChecked1,
                                  checkedColor: Colors.blue,
                                  style: MSHCheckboxStyle.stroke,
                                  onChanged: (selected) {
                                    setState(() {
                                      isChecked1 = selected;
                                      plan = "Standard";
                                      valid = "9 January 2022";
                                    });
                                  },
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Standard',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 118, 117, 117),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MSHCheckbox(
                                  size: 20,
                                  value: isChecked2,
                                  checkedColor: Colors.blue,
                                  style: MSHCheckboxStyle.stroke,
                                  onChanged: (selected) {
                                    setState(() {
                                      isChecked2 = selected;
                                      plan = "Premium";
                                      valid = "9 February 2022";
                                    });
                                  },
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Premium',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 118, 117, 117),
                                  ),
                                ),
                              ]),
                        ])),
                    SizedBox(height: 45),
                    cardnameField,
                    SizedBox(height: 45),
                    cardnumberField,
                    SizedBox(height: 45),
                    cvvField,
                    SizedBox(height: 45),
                    signupButton,
                    SizedBox(height: 45),
                  ],
                ),
              ),
            ),
          ),
        )),
      );
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstNameEditingController.text;
    userModel.secondname = secondNameEditingController.text;
    userModel.plan1 = plan1;
    userModel.institute = institutionEiditingController.text;
    userModel.phonenumber = phonenumberEditingController.text;
    userModel.plan = plan;
    userModel.cardname = cardnameEditingController.text;
    userModel.cardnumber = cardnumberEditingController.text;
    userModel.cvv = cvvEditingController.text;
    userModel.expiry = expiryEditingController.text;
    userModel.valid = valid;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.of(context).pushNamedAndRemoveUntil('/main/', (route) => false);
  }
}
