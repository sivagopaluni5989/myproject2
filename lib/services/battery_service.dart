import 'package:flutter/foundation.dart';


class BatteryService {


  bool _running = false;


  bool get running => _running;



  void start({

    required VoidCallback onBatteryRemoved,

  }) {


    _running = true;


    debugPrint("🔋 Battery Guard Started");


    // Battery disconnect detection will be connected here.
    // Android battery events can be added later.



  }




  void stop() {


    _running = false;


    debugPrint("🔋 Battery Guard Stopped");


  }


}
