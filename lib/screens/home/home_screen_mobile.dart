import 'package:feynman1/screens/header/header.dart';
import 'package:feynman1/screens/home/data.dart';
import 'package:feynman1/screens/home/functions.dart';
import 'package:feynman1/screens/login_page.dart';
import 'package:feynman1/utils/functions.dart';
import 'package:feynman1/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => setState(() {
          _scrollListener();
        }));
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
    return Scaffold(
      endDrawer: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => Drawer(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Material(
              child: DrawerHeader(
                margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 15, 15, 15),
                        Color.fromARGB(255, 71, 70, 70)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < navBarButtonText.length; i++)
                      TextButton(
                        onPressed: null,
                        child: InkWell(
                          hoverColor: Color.fromARGB(255, 250, 247, 247)
                              .withOpacity(0.15),
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {
                            scrollControl(globalKeys[i]);
                          },
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "${navBarButtonText[i]}",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 248, 246, 246),
                                    fontSize: 20),
                              ),
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
                    TextButton(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                              color: Color.fromARGB(255, 248, 246, 246),
                              fontSize: 20),
                        ),
                        onPressed: () async {
                          // logout(context);
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/login/', (_) => false);
                        }),
                  ],
                ),
                curve: SawTooth(12),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                // ignore: deprecated_member_use
                backwardsCompatibility: true,
                leading: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  margin: EdgeInsets.only(left: 20),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        scrollControl(homeKeys);
                      },
                      child: Text(
                        "SIR VISVESVARAYA".toUpperCase(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 252, 251, 251),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
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
