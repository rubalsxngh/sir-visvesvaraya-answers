import 'package:feynman1/constant/color.dart';
import 'package:feynman1/screens/signup_page.dart';
import 'package:flutter/material.dart';

class TableSecond extends StatelessWidget {
  const TableSecond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
        color: cardColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Premium',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          /*Image(image: AssetImage('images/poke2.png'), height: 100),
          SizedBox(
            height: 30,
          ),*/
          Text(
            'Unlimited Searches',
            style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'image search',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Video search',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Help and support',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Free App service',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 35,
            width: 130,
            child: Center(
              child: ActionChip(
                label: Text("Register"),
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 12, 12, 12), fontSize: 15),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                backgroundColor: Color.fromARGB(255, 248, 246, 246),
              ),
            ),
          )
        ],
      ),
    );
  }
}
