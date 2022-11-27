import 'package:feynman1/screens/header/header.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EducationLayout extends StatelessWidget {
  const EducationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
        mobile: videoMobilePage(),
        tablet: videoMobilePage(),
        desktop: videoWebPage());
  }
}
