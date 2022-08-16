import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kActiveColor = Color(0xFF1D1F33);
const kButtonColor = Color(0xFF2C8CE7);
const kTextFieldDecoration = InputDecoration(
  hintText: "Enter a value",
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Colors.lightBlue, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
  ),
);
final kTextStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1.5,
    color: Colors.white);
