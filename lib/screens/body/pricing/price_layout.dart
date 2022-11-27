import 'package:feynman1/screens/body/pricing/price_mobile.dart';
import 'package:feynman1/screens/body/pricing/price_web.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class priceLayout extends StatelessWidget {
  const priceLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
      mobile: PriceMobile(),
      tablet: PriceMobile(),
      desktop: PriceWeb(),
    );
  }
}
