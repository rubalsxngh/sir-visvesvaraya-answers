import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feynman1/screens/home/home_screen_layout.dart';
import 'package:feynman1/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'constant/user_model.dart';

class HomeScreen1 extends StatefulWidget {
  HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  File? pickedImage;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 8, 8),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 81, 81, 81),
          elevation: 0,
          title: Text(
            "PROFILE",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreenLayout()));
            },
            child: Icon(
              Icons.home,
              size: 40, // add custom icons also
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage('assets/image5.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 80),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(0, 141, 68, 5), width: 5),
                          ),
                          child: ClipOval(
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
                                    width: 170,
                                    height: 170,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/image3.jpg',
                                    width: 180,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 150),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 220,
                                  height: 150,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 244, 60, 60),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 500,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 5,
                            color: Color.fromARGB(255, 220, 40, 4),
                          ),
                          color: Color.fromARGB(255, 252, 252, 251),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text("User Details"),
                            ),
                            Divider(),
                            ListTile(
                              title: Text("Name"),
                              subtitle: Text(
                                  "${loggedInUser.firstname}${loggedInUser.secondname}"),
                              leading: Icon(Icons.person),
                            ),
                            ListTile(
                              title: Text("Email"),
                              subtitle: Text("${loggedInUser.email}"),
                              leading: Icon(Icons.email),
                            ),
                            ListTile(
                              title: Text("Ph. Number"),
                              subtitle: Text("${loggedInUser.phonenumber}"),
                              leading: Icon(
                                Icons.call,
                              ),
                            ),
                            ListTile(
                              title: Text("Institute/Organization"),
                              subtitle: Text("${loggedInUser.plan1}"
                                  " : "
                                  "${loggedInUser.institute}"),
                              leading: Icon(
                                Icons.event_available,
                              ),
                            ),
                            ListTile(
                              title: Text("Plan"),
                              subtitle: Text("${loggedInUser.plan}"),
                              leading: Icon(
                                Icons.list_alt,
                              ),
                            ),
                            ListTile(
                              title: Text("Plan Valid Till"),
                              subtitle: Text("${loggedInUser.valid}"),
                              leading: Icon(
                                Icons.event_available,
                              ),
                            ),
                            ListTile(
                              title: Text("Card Holder Name"),
                              subtitle: Text("${loggedInUser.cardname}"),
                              leading: Icon(
                                Icons.event_available,
                              ),
                            ),
                            ActionChip(
                              label: Text("Logout"),
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 12, 12, 12),
                              ),
                              onPressed: () {
                                logout(context);
                              },
                              side: BorderSide(
                                  color: Color.fromARGB(255, 237, 4, 4)),
                              backgroundColor:
                                  Color.fromARGB(255, 245, 235, 233),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => login_page()));
}
