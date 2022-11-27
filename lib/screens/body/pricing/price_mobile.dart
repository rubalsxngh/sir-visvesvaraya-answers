//import 'package:app3/screens/body/skills/data.dart';
//import 'package:app3/widgets/skill_bar_builder.dart';
import 'package:feynman1/constant/color.dart';
import 'package:feynman1/screens/body/pricing/table1.dart';
import 'package:feynman1/screens/body/pricing/table2.dart';
import 'package:feynman1/screens/body/pricing/table3.dart';
import 'package:flutter/material.dart';

class PriceMobile extends StatelessWidget {
  const PriceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            "Pricing",
            style: TextStyle(
                color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          color: Colors.white,
          child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 80),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TableFirst(),
                  SizedBox(
                    height: 5,
                  ),
                  TableSecond(),
                  SizedBox(
                    height: 5,
                  ),
                  TableThird(),
                ],
              )),
        ),
      ],
    );
  }
}
