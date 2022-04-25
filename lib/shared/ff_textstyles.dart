import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FireFlutterTextStyles {
  ///title
  static TextStyle poppinsSize28Weight700Black = GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black);

  ///subtitle
  static TextStyle poppinsSize16Weight400BlackOpacity60 = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.6));

  /// buttonHintText
  static TextStyle poppinsSize18Weight500Black(
      {bool withOpacity = false, double? height}) {
    return GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: withOpacity ? Colors.black.withOpacity(0.6) : Colors.black,
        height: height);
  }

  //terms and conditions
  static TextStyle poppinsSize12Weight400BlackOpacity60(
      {bool withOpacity = true}) {
    return GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: withOpacity ? Colors.black.withOpacity(0.6) : Colors.black,
        height: 1.5);
  }
}
