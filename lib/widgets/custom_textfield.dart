import 'package:flutter/material.dart';

class CustomFromField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double width;
  const CustomFromField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width ?? width / 4 - 100,
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 247, 246, 249),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 254, 254)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 10),
          prefixIcon: Icon(
            icon,
            size: 18,
            color: Color.fromARGB(255, 16, 15, 15),
          ),
        ),
      ),
    );
  }
}
