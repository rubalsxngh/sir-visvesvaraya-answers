/*import 'package:feyman1/constant/color.dart';
//import 'package:app3/widgets/exprience_card_builder.dart';
import 'package:flutter/material.dart';
/*import 'package:portfolio/constant/color.dart';
import 'package:portfolio/screens/body/exprience/data.dart';
import 'package:portfolio/widgets/exprience_card_builder.dart';*/

class text_MobilePage extends StatelessWidget {

  const text_MobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          child: Center(
              child: Text(
            "",
            style: TextStyle(
                color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 50),
          width: MediaQuery.of(context).size.width,
          color: defaultWhite,
          /*child: Center(
              child: Text(
          
            style: TextStyle(
                color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),
          )),*/
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
*/