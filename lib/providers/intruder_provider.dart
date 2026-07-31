import 'package:flutter/material.dart';

import '../services/camera_service.dart';
import '../services/intruder_service.dart';
import '../services/history_service.dart';
import '../models/security_event_model.dart';



class IntruderProvider extends ChangeNotifier {


  final CameraService _cameraService =
      CameraService();


  final IntruderService _intruderService =
      IntruderService();


  final HistoryService _historyService =
      HistoryService();




  bool _activated = false;


  bool get activated => _activated;





  Future<void> activateIntruderMode() async {


    if (_activated) return;



    _activated = true;


    notifyListeners();




    final photoPath =
        await _cameraService.captureIntruderPhoto();




    await _intruderService.triggerIntruderMode();




    await _historyService.addEvent(


      SecurityEventModel(

        type: "Intruder Alert",

        time:
            DateTime.now().toString(),


        message:
            photoPath == null
                ? "Wrong PIN detected"
                : "Intruder photo captured",


      ),


    );



  }





  Future<void> resetIntruderMode() async {


    _activated = false;


    notifyListeners();


  }


}
