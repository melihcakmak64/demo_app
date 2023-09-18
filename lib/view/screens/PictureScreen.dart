import 'dart:io';

import 'package:camera/camera.dart';
import 'package:demo_app/cameraController.dart';
import 'package:demo_app/constants/colors.dart';
import 'package:demo_app/view/screens/MessageScreen.dart';
import 'package:demo_app/view/widgets/buttons.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/notication_service.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({super.key});

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  bool takeStatus = false;
  XFile? photo;

  void takePicture() async {
    photo = await MyCameraController.takePicture();
    takeStatus = true;
    if (photo != null) {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('images/')
          .child(DateTime.now().toString() + ".jpg");

      UploadTask task = ref.putFile(File(photo!.path));

      task.whenComplete(() {
        NotificationService()
            .sendNotification("demo", "Thank you for sharing food with me");
      });
      setState(() {});
    }
  }

  void confirm() {
    takeStatus = false;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MessageScreen(message: "GOOD JOB"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 24, left: 24),
              child: myIconButton(Icons.arrow_back, 45.0, () {
                if (takeStatus == false) {
                  Navigator.pop(context);
                } else {
                  setState(() {
                    takeStatus = false;
                  });
                }
              })),
          Image.asset(
            "assets/baby.png",
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: MyColors.gray,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/cutlery.png"),
                      Image.asset("assets/Corners.png"),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            height: 200,
                            width: 200,
                            child: takeStatus
                                ? Image.file(
                                    File(photo!.path),
                                    fit: BoxFit.cover,
                                  )
                                : CameraPreview(MyCameraController.controller)),
                      )
                    ],
                  ),
                  Text(
                    takeStatus ? "Will you eat this?" : "Click your meal",
                    style: GoogleFonts.andika(fontSize: 24),
                  ),
                  myIconButton(
                      takeStatus ? Icons.check : Icons.camera_alt_outlined,
                      64.0,
                      takeStatus ? confirm : takePicture)
                ]),
          ))
        ],
      ),
    );
  }
}
