import 'package:feynman1/constant/url.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

double expandedHight = 570.0;
double res = 0.0;

List<String> socialURL = [
  URL.facebookURL,
  URL.linkedinURL,
  URL.githubURL,
  URL.stackoverflowURL
];

List<IconData> socialIcon = [
  FontAwesomeIcons.facebookF,
  FontAwesomeIcons.linkedinIn,
  FontAwesomeIcons.github,
  FontAwesomeIcons.stackOverflow
];

List<dynamic> bodyScrollControlHeight = [550, 980, 1500, 2600];

List<String> navBarButtonText = ["About", "Pricing", "Contact"];
final homeKeys = GlobalKey();
final aboutKeys = GlobalKey();
final pricingKeys = GlobalKey();
final contactKeys = GlobalKey();
final textKeys = GlobalKey();
final imagevideoKeys = GlobalKey();
final educationKeys = GlobalKey();
List<GlobalKey> globalKeys = <GlobalKey>[
  aboutKeys,
  pricingKeys,
  contactKeys,
  textKeys,
  imagevideoKeys,
  educationKeys,
];
