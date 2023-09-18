import 'package:demo_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: GoogleFonts.lilitaOne(color: MyColors.green, fontSize: 48),
        ),
      ),
    );
  }
}
