import 'dart:async';
import 'package:vibration/vibration.dart';

class VibrationService {

  Timer? _timer;

  bool _isVibrating = false;


  Future<void> startVibration() async {

    if (_isVibrating) return;

    _isVibrating = true;


    if (await Vibration.hasVibrator()) {

      _timer = Timer.periodic(
        const Duration(seconds: 2),
        (timer) {

          Vibration.vibrate(
            duration: 1000,
          );

        },
      );

    }

  }



  Future<void> stopVibration() async {

    _isVibrating = false;


    _timer?.cancel();

    _timer = null;


    await Vibration.cancel();

  }


}
