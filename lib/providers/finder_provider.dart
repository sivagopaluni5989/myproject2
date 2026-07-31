import 'package:flutter/material.dart';

import '../services/clap_service.dart';
import '../services/whistle_service.dart';
import '../services/alarm_service.dart';
import '../services/vibration_service.dart';
import '../services/flashlight_service.dart';
import '../services/history_service.dart';

import '../models/security_event_model.dart';


class FinderProvider extends ChangeNotifier {


  final ClapService _clapService =
      ClapService();


  final WhistleService _whistleService =
      WhistleService();


  final AlarmService _alarmService =
      AlarmService();


  final VibrationService _vibrationService =
      VibrationService();


  final FlashlightService _flashlightService =
      FlashlightService();


  final HistoryService _historyService =
      HistoryService();



  bool _enabled = false;


  bool get enabled => _enabled;



  String _mode = "Clap";


  String get mode => _mode;



  void setMode(String value) {

    _mode = value;

    notifyListeners();

  }





  Future<void> startFinder() async {


    if (_enabled) return;


    _enabled = true;

    notifyListeners();



    if (_mode == "Clap") {


      _clapService.start(

        onClapDetected: () async {

          await _triggerAlarm(
            "Clap Detected",
          );

        },

      );


    } else {


      _whistleService.start(

        onWhistleDetected: () async {

          await _triggerAlarm(
            "Whistle Detected",
          );

        },

      );

    }


  }






  Future<void> _triggerAlarm(String event) async {


    await _alarmService.police();


    await _vibrationService.startVibration();


    await _flashlightService.startBlinking();



    await _historyService.addEvent(

      SecurityEventModel(

        type: "Finder",

        time:
            DateTime.now().toString(),

        message:
            event,

      ),

    );


  }





  Future<void> stopFinder() async {


    _clapService.stop();


    _whistleService.stop();


    await _alarmService.stopAlarm();


    await _vibrationService.stopVibration();


    await _flashlightService.stopBlinking();



    _enabled = false;


    notifyListeners();


  }


}
