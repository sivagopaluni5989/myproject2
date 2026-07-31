import 'package:flutter/material.dart';

import '../services/charger_service.dart';
import '../services/alarm_service.dart';
import '../services/history_service.dart';
import '../models/security_event_model.dart';


class ChargerProvider extends ChangeNotifier {


  final ChargerService _chargerService =
      ChargerService();


  final AlarmService _alarmService =
      AlarmService();


  final HistoryService _historyService =
      HistoryService();



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




    _chargerService.start(

      onChargerRemoved: () async {


        debugPrint(
          "🔌 Charger Removed",
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





        await _historyService.addEvent(


          SecurityEventModel(

            type:
                "Charger Removed",


            time:
                DateTime.now().toString(),


            message:
                "Charger disconnected",

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


    await _chargerService.stop();


    await _alarmService.stopAlarm();


    _enabled = false;


    notifyListeners();


  }




  @override
  void dispose() {


    _chargerService.stop();


    super.dispose();

  }


}
