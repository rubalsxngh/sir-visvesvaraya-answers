import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  const SocialButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          // ignore: deprecated_member_use
          /* child: RaisedButton(
              onPressed: onPressed(),
              color: Color.fromARGB(255, 11, 11, 11),
              textColor: Color.fromARGB(255, 250, 247, 247),
              shape: CircleBorder(side: BorderSide.none),
              child: Icon(icon)),*/
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
