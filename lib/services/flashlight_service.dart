import 'package:flutter/foundation.dart';

import 'dart:async';

import 'package:torch_light/torch_light.dart';


class FlashlightService {


  Timer? _timer;


  bool _isBlinking = false;


  Future<void> startBlinking() async {


    if (_isBlinking) return;


    _isBlinking = true;


    bool status = false;


    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) async {


        status = !status;


        try {

          if (status) {

            await TorchLight.enableTorch();

          } else {

            await TorchLight.disableTorch();

          }


        } catch (e) {

          debugPrint("Flashlight Error: $e");

        }


      },
    );


  }





  Future<void> stopBlinking() async {


    _isBlinking = false;


    _timer?.cancel();


    _timer = null;


    try {

      await TorchLight.disableTorch();

    } catch (e) {

      debugPrint("Flashlight Stop Error: $e");

    }


  }


}

