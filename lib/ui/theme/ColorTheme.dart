import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTheme {
  static const orangeColor = Color(0xFFFF7A00);
  static const blackColor = Color(0xFF1F1F1F);
  static const greyColor = Color(0xff7B7B7B);
  static const redColor = Color(0xffED2736);
}

TextStyle redTextStyle = GoogleFonts.poppins(
  color: ColorTheme.redColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: ColorTheme.blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: Colors.white,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: ColorTheme.greyColor,
);
