

import 'package:flutter/material.dart';

import '../services/pocket_service.dart';
import '../services/alarm_service.dart';
import '../services/history_service.dart';
import '../services/vibration_service.dart';
import '../services/flashlight_service.dart';

import '../models/security_event_model.dart';



class PocketProvider extends ChangeNotifier {


  final PocketService _pocketService =
      PocketService();


  final AlarmService _alarmService =
      AlarmService();


  final HistoryService _historyService =
      HistoryService();

  final VibrationService _vibrationService =
      VibrationService();


  final FlashlightService _flashlightService =
      FlashlightService();


  bool _enabled = false;


  bool get enabled => _enabled;




  String _selectedAlarm = "Police Siren";


  String get selectedAlarm => _selectedAlarm;




  void setAlarm(String alarm) {


    _selectedAlarm = alarm;


    notifyListeners();


  }




  BuildContext? _context;



  void setContext(BuildContext context) {


    _context = context;


  }






  Future<void> startProtection() async {


    if (_enabled) return;



    _enabled = true;


    notifyListeners();




    _pocketService.start(


      onPocketRemoved: () async {



        debugPrint(
          "📱 Phone Removed",
        );




        switch (_selectedAlarm) {


          case "Ambulance":

            await _alarmService.ambulance();

            break;



          case "Fire Alarm":

            await _alarmService.fire();

            break;



          case "Emergency":

            await _alarmService.emergency();

            break;



          case "Loud Horn":

            await _alarmService.horn();

            break;



          default:

            await _alarmService.police();

        }


        await _vibrationService.startVibration();


        await _flashlightService.startBlinking();


        await _historyService.addEvent(


          SecurityEventModel(


            type:
                "Pocket Removal",



            time:
                DateTime.now().toString(),



            message:
                "Phone removed from pocket",


          ),


        );





        _openSecurityScreen();


      },


    );


  }






  void _openSecurityScreen() {


    if (_context == null) return;



    Navigator.pushNamed(

      _context!,

      "/security",

    );


  }



  Future<void> stopProtection() async {


  await _pocketService.stop();


  await _alarmService.stopAlarm();


  await _vibrationService.stopVibration();


  await _flashlightService.stopBlinking();



  



    _enabled = false;



    notifyListeners();


  }





  @override
  void dispose() {


    _pocketService.stop();


    super.dispose();


  }


}

