import 'dart:html';

import 'package:feynman1/screens/body/contact/data.dart';
import 'package:feynman1/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*import 'package:portfolio/screens/body/contact/data.dart';
import 'package:portfolio/widgets/address_tile.dart';
import 'package:portfolio/widgets/custom_textfield.dart';*/

class ContactWebPage extends StatefulWidget {
  const ContactWebPage({super.key});

  @override
  State<ContactWebPage> createState() => _ContactWebPageState();
}

final _formKey = GlobalKey<FormState>();
final nameController = TextEditingController();
final subjectController = TextEditingController();

final TextEditingController emailController = new TextEditingController();
//final emailController = TextEditingController();
final messageController = TextEditingController();
Future sendemail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_5tmsplr";
  const templateId = "template_c0k57mc";
  const userId = "sIU1xwh2tTXzaEHo3";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "name": nameController.text,
          "subject": subjectController.text,
          "message": messageController.text,
          "user_email": emailController.text,
        }
      }));
  return response.statusCode;
}

class _ContactWebPageState extends State<ContactWebPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.43;
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 246, 248, 247),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          /*child: Image.asset(
            "assets/contact_bg.png",
            fit: BoxFit.cover,
          ),*/
        ),
        Positioned(
          top: 100,
          bottom: 100,
          left: width - 250,
          right: width - 250,
          child: Container(
            decoration: boxDecoration(),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Contact Us",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Feel free to contact us",
                                    style: TextStyle(
                                        height: 1.6,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff2c2c2c))),
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 247, 246, 249),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 254, 254)),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    hintText: "Name",
                                    contentPadding: EdgeInsets.only(top: 10),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 18,
                                      color: Color.fromARGB(255, 16, 15, 15),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: subjectController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 247, 246, 249),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 254, 254)),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    hintText: "Subject",
                                    contentPadding: EdgeInsets.only(top: 10),
                                    prefixIcon: Icon(
                                      Icons.note,
                                      size: 18,
                                      color: Color.fromARGB(255, 16, 15, 15),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  autofocus: false,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter Your Email");
                                    }
                                    // reg expression for email validation
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 247, 246, 249),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 254, 254)),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    hintText: "Email",
                                    contentPadding: EdgeInsets.only(top: 10),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: 18,
                                      color: Color.fromARGB(255, 16, 15, 15),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  //height: 82,
                                  child: TextFormField(
                                    controller: messageController,
                                    minLines: 6,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: "Write your message....",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 11, 11, 11)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: buttonStyle(),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        sendemail();
                                      }
                                    },
                                    child: Text(
                                      "Send",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 80),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]);
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 9, 9, 9)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        )));
  }
}
