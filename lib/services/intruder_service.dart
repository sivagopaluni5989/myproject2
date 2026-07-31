import 'package:flutter/foundation.dart';

import '../models/security_event_model.dart';
import 'history_service.dart';


class IntruderService {


  final HistoryService _historyService =
      HistoryService();



  Future<void> triggerIntruderMode() async {


    debugPrint(
      "🚨 INTRUDER MODE ACTIVATED",
    );



    final event =
        SecurityEventModel(

      type: "Intruder",

      time:
          DateTime.now().toString(),

      message:
          "Multiple wrong PIN attempts detected",

    );



    await _historyService.addEvent(
      event,
    );


  }


}
