import 'package:flutter/material.dart';

import '../services/battery_service.dart';
import '../services/alarm_service.dart';
import '../services/vibration_service.dart';
import '../services/flashlight_service.dart';
import '../services/history_service.dart';

import '../models/security_event_model.dart';



class BatteryProvider extends ChangeNotifier {


  final BatteryService _batteryService =
      BatteryService();


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





  Future<void> startProtection() async {


    if (_enabled) return;



    _enabled = true;

    notifyListeners();




    _batteryService.start(

      onBatteryRemoved: () async {


        await _alarmService.police();



        await _vibrationService.startVibration();



        await _flashlightService.startBlinking();




        await _historyService.addEvent(


          SecurityEventModel(

            type: "Battery Removed",

            time:
                DateTime.now().toString(),


            message:
                "Battery disconnect detected",


          ),


        );



      },


    );



  }







  Future<void> stopProtection() async {


    _batteryService.stop();



    await _alarmService.stopAlarm();



    await _vibrationService.stopVibration();



    await _flashlightService.stopBlinking();



    _enabled = false;


    notifyListeners();


  }


}
