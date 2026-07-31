import '../services/history_service.dart';
import '../models/security_event_model.dart';
import 'package:flutter/material.dart';
import '../services/alarm_service.dart';
import '../services/motion_service.dart';
import '../services/vibration_service.dart';
import '../services/flashlight_service.dart';

class MotionProvider extends ChangeNotifier {

  final MotionService _motionService = MotionService();

  final AlarmService _alarmService = AlarmService();

  final VibrationService _vibrationService = VibrationService();

  final FlashlightService _flashlightService = FlashlightService();
  
  final HistoryService _historyService = HistoryService();

  bool _isProtectionEnabled = false;

  bool get isProtectionEnabled => _isProtectionEnabled;


  String _selectedAlarm = "Police Siren";

  String get selectedAlarm => _selectedAlarm;



  BuildContext? _context;


  void setContext(BuildContext context) {
    _context = context;
  }



  void setAlarm(String alarm) {

    _selectedAlarm = alarm;

    notifyListeners();

  }



  Future<void> startProtection() async {

    if (_isProtectionEnabled) return;


    _isProtectionEnabled = true;

    notifyListeners();


    _motionService.start(

             onMotionDetected: () async {

          debugPrint("🚨 Motion Detected");

          await _historyService.addEvent(
            SecurityEventModel(
              type: "Motion",
              time: DateTime.now().toString(),
              message: "Phone movement detected",
            ),
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


    await _motionService.stop();


    await _alarmService.stopAlarm();


    await _vibrationService.stopVibration();


    await _flashlightService.stopBlinking();



    _isProtectionEnabled = false;


    notifyListeners();

  }



  @override
  void dispose() {

    _motionService.dispose();

    super.dispose();

  }

}
