import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';



class CameraService {


  CameraController? _controller;


  bool _ready = false;


  bool get ready => _ready;



  Future<void> initialize() async {


    try {


      final cameras = await availableCameras();


      if (cameras.isEmpty) {

        debugPrint("No camera available");

        return;

      }



      final frontCamera = cameras.firstWhere(

        (camera) =>
            camera.lensDirection ==
            CameraLensDirection.front,

        orElse: () => cameras.first,

      );



      _controller = CameraController(

        frontCamera,

        ResolutionPreset.medium,

        enableAudio: false,

      );



      await _controller!.initialize();



      _ready = true;


      debugPrint(
        "📸 Camera Initialized",
      );



    } catch (e) {


      debugPrint(
        "Camera Error: $e",
      );


    }

  }






  Future<String?> captureIntruderPhoto() async {


    try {


      if (!_ready) {

        await initialize();

      }



      if (_controller == null ||
          !_controller!.value.isInitialized) {


        return null;


      }



      final directory =
          await getApplicationDocumentsDirectory();



      final path =
          "${directory.path}/intruder_${DateTime.now().millisecondsSinceEpoch}.jpg";



      final image =
          await _controller!.takePicture();



      final savedFile =
          await File(image.path).copy(path);



      debugPrint(
        "📸 Intruder photo saved: ${savedFile.path}",
      );



      return savedFile.path;



    } catch (e) {


      debugPrint(
        "Capture Error: $e",
      );


      return null;


    }

  }






  Future<void> dispose() async {


    await _controller?.dispose();


    _controller = null;


    _ready = false;


  }



}
