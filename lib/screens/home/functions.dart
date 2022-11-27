import 'package:feynman1/screens/body/Search_image_viddeo/image_video_layout.dart';
import 'package:feynman1/screens/body/Text/text_layout.dart';
import 'package:feynman1/screens/body/about/about_layout.dart';
import 'package:feynman1/screens/body/contact/contact_layout.dart';
import 'package:feynman1/screens/body/education/education_layout.dart';
import 'package:feynman1/screens/body/pricing/price_layout.dart';
import 'package:feynman1/screens/footer/footer.dart';
import 'package:feynman1/screens/home/data.dart';
import 'package:flutter/material.dart';

ScrollController scrollController = new ScrollController();

Column pages() {
  return Column(
    children: [
      Container(child: text_Layout(), key: textKeys),
      Container(child: image_video_layout(), key: imagevideoKeys),
      Container(child: EducationLayout(), key: educationKeys),
      Container(child: AboutLayout(), key: aboutKeys),
      Container(child: priceLayout(), key: pricingKeys),
      Container(
        child: ContactLayout(),
        key: contactKeys,
      ),

      //Container(child: ReferenceLayout())
      Container(child: FooterPage())
    ],
  );
}

Future scrollControl(keys) async {
  final context = keys.currentContext;
  await Scrollable.ensureVisible(
    context,
    duration: Duration(milliseconds: 1000),
    curve: Curves.fastOutSlowIn,
  );
}

void goToTop(double height) {
  scrollController.animateTo(
    height,
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
  );
}
