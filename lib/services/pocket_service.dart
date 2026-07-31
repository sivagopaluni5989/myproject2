import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';


class PocketService {


  StreamSubscription<AccelerometerEvent>? _subscription;


  bool _running = false;



  bool get isRunning => _running;



  static const double removalThreshold = 18.0;




  void start({

    required VoidCallback onPocketRemoved,

  }) {


    if (_running) return;


    _running = true;



    _subscription =
        accelerometerEventStream().listen((event) {


      final movement =

          event.x.abs() +

          event.y.abs() +

          event.z.abs();



      if (movement > removalThreshold) {


        onPocketRemoved();


      }


    });


  }





  Future<void> stop() async {


    await _subscription?.cancel();


    _subscription = null;


    _running = false;


  }


}



typedef VoidCallback = void Function();
