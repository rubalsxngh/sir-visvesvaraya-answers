import 'package:feynman1/screens/header/header.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class image_video_layout extends StatelessWidget {
  const image_video_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
        mobile: image_video_MobilePage(),
        tablet: image_video_MobilePage(),
        desktop: image_video_WebPage());
  }
}
