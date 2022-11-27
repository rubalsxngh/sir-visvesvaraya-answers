import 'package:feynman1/screens/header/header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class text_Layout extends StatelessWidget {
  const text_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
        mobile: text_MobilePage(),
        tablet: text_MobilePage(),
        desktop: text_WebPage());
  }
}
