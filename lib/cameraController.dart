import 'package:camera/camera.dart';

class MyCameraController {
  static late final List<CameraDescription> cameras;
  static late final CameraController controller;
  MyCameraController() {
    init();
  }

  static Future<void> init() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller.initialize();
  }

  static Future<XFile> takePicture() async {
    final XFile file = await controller.takePicture();

    return file;
  }
}
