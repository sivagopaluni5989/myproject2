import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/security_event_model.dart';


class HistoryService {


  static const String _key = "security_history";



  Future<void> addEvent(
      SecurityEventModel event) async {


    final prefs =
        await SharedPreferences.getInstance();



    final data =
        prefs.getStringList(_key) ?? [];



    data.add(
      jsonEncode(
        event.toJson(),
      ),
    );



    await prefs.setStringList(
      _key,
      data,
    );

  }




  Future<List<SecurityEventModel>> getHistory() async {


    final prefs =
        await SharedPreferences.getInstance();



    final data =
        prefs.getStringList(_key) ?? [];



    return data.map((item) {


      return SecurityEventModel.fromJson(

        jsonDecode(item),

      );


    }).toList();

  }




  Future<void> clearHistory() async {


    final prefs =
        await SharedPreferences.getInstance();


    await prefs.remove(_key);


  }


}
