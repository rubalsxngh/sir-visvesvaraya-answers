//import 'package:app3/screens/body/skills/data.dart';
//import 'package:app3/widgets/skill_bar_builder.dart';
import 'package:feynman1/screens/body/pricing/table1.dart';
import 'package:feynman1/screens/body/pricing/table2.dart';
import 'package:feynman1/screens/body/pricing/table3.dart';
import 'package:flutter/material.dart';

class PriceWeb extends StatelessWidget {
  const PriceWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.43;
    return Column(
      children: [
        SizedBox(
          height: 120,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TableFirst(),
            SizedBox(
              width: 20,
            ),
            TableSecond(),
            SizedBox(
              width: 20,
            ),
            TableThird(),
          ],
        )
      ],
    );
  }
}
