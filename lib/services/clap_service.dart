import 'package:flutter/foundation.dart';


class ClapService {


  bool _running = false;


  bool get running => _running;



  void start({
    required VoidCallback onClapDetected,
  }) {


    _running = true;


    debugPrint("👏 Clap Finder Started");


    // Future microphone detection will be added here.
    // Currently service structure is ready.


  }



  void stop() {


    _running = false;


    debugPrint("👏 Clap Finder Stopped");


  }


}
