import 'package:feynman1/screens/header/header.dart';
import 'package:feynman1/screens/home/data.dart';
import 'package:feynman1/screens/home/functions.dart';
import 'package:feynman1/screens/login_page.dart';
import 'package:feynman1/utils/functions.dart';
import 'package:feynman1/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreenWeb extends StatefulWidget {
  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      scrollController.addListener(() => setState(() {
            _scrollListener();
          }));
    });
  }

  var values = 0.0;
  _scrollListener() {
    if (scrollController.position.pixels <=
        scrollController.position.maxScrollExtent) {
      setState(() {
        values = scrollController.position.pixels;
      });
    }
  }

  double get top {
    res = expandedHight;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      if (offset < (res - kToolbarHeight)) {
        setState(() {
          res -= offset;
        });
      } else {
        setState(() {
          res = kToolbarHeight;
        });
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.43;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                // ignore: deprecated_member_use
                backwardsCompatibility: true,
                title: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  margin: EdgeInsets.only(left: width / 4 - 15),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        scrollControl(homeKeys);
                      },
                      child: Text(
                        "SIR VISVESVARAYA".toUpperCase(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 249, 248, 248),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                //Navigation bar section
                actions: [
                  for (int i = 0; i < navBarButtonText.length; i++)
                    InkWell(
                      hoverColor:
                          Color.fromARGB(255, 250, 247, 247).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {
                        scrollControl(globalKeys[i]);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "${navBarButtonText[i]}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 248, 246, 246),
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  TextButton(
                      child: Text(
                        'Login/Signup',
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 246, 246),
                            fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login_page()));
                      }),
                  SizedBox(width: 10),
                  PopupMenuButton(
                    child: Center(child: Icon(Icons.account_circle)),
                    itemBuilder: (context) {
                      return List.generate(1, (index) {
                        return PopupMenuItem(
                          value: index,
                          child: TextButton(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 11, 11, 11),
                                    fontSize: 15),
                              ),
                              onPressed: () async {
                                final user = FirebaseAuth.instance.currentUser;
                                if (user == null) {
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/profile/', (_) => false);
                                }

                                // logout(context);
                              }),
                        );
                      });
                    },
                  ),
                  SizedBox(width: (width / 4) - 15),
                ],

                leadingWidth: 200,
                expandedHeight: 600.0,
                floating: true,
                pinned: true,
                snap: true,
                elevation: 50,

                backgroundColor: Color.fromARGB(197, 6, 6, 6),

                //StickyHeader Section
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(key: homeKeys, child: StickyHeader()),
                ),
              ),

              //Body and Footer Section
              Container(
                child: SliverList(
                  delegate: new SliverChildListDelegate([pages()]),
                ),
              ),
            ],
          ),

          //Social button section
          values <= 500 || values == null
              ? Positioned(
                  top: top,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < socialURL.length; i++)
                          SocialButton(
                            onPressed: () async {
                              await launchURL(socialURL[i]);
                            },
                            icon: socialIcon[i],
                          ),
                      ],
                    ),
                  ))
              : Container(height: 0),
          //Image.asset("assets/image1.jpg")
        ],
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
