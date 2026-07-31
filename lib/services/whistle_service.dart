import 'package:flutter/foundation.dart';


class WhistleService {


  bool _running = false;


  bool get running => _running;



  void start({
    required VoidCallback onWhistleDetected,
  }) {


    _running = true;


    debugPrint("🎵 Whistle Finder Started");


    // Future microphone detection will be added here.


  }




  void stop() {


    _running = false;


    debugPrint("🎵 Whistle Finder Stopped");


  }


}
