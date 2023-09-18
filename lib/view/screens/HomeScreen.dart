import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/view/screens/PictureScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: myButton("Share your meal", height / 12, width * 0.7, () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PictureScreen(),
              ));
            })),
      ),
    );
  }

  InkWell myButton(String text, height, width, void Function() function) {
    return InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: MyColors.green, borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.andika(
            fontSize: 25,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
