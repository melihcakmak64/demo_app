import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

InkWell myTextButton(String text, height, width, void Function() function) {
  return InkWell(
    onTap: function,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: HexColor("#3E8B3A"), borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      )),
    ),
  );
}

InkWell myIconButton(IconData icon, size, void Function() function) {
  return InkWell(
    onTap: function,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: HexColor("#3E8B3A"), borderRadius: BorderRadius.circular(50)),
      child: Center(
          child: Icon(
        icon,
        color: Colors.white,
      )),
    ),
  );
}
