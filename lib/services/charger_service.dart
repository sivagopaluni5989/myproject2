import 'dart:async';

import 'package:battery_plus/battery_plus.dart';


class ChargerService {

  final Battery _battery = Battery();


  StreamSubscription<BatteryState>? _subscription;


  void start({
    required Function onChargerRemoved,
  }) {


    _subscription =
        _battery.onBatteryStateChanged.listen(
      (state) {


        if (state == BatteryState.discharging) {

          onChargerRemoved();

        }


      },
    );


  }




  Future<void> stop() async {

    await _subscription?.cancel();

    _subscription = null;

  }


}
