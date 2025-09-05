import 'package:flutter/material.dart';
const String kApiBaseUrl = 'http://167.86.111.168:8000';
const kStripePublishableKey = "pk_test_51PYBWYEHNPXRJDcCFN2ptmqDupVyU2oEuzaCSpaoJKy9dQRutoiqkCLPOVjhAltgqqESS6WpPugmGcuinfUbt3MZ00D1AYyE0m";
const kDarkColor = Color(0xFF222222);
const kPrimaryColor = Color(0xFFf0ca05);
const kSecondaryColor = Color(0xFF5fabe4);
const kSuccessColor = Color(0xFF52a953);
const kDangerColor = Color(0xFFd86056);
const kGreenShade = Color(0xFF64fbd6);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
