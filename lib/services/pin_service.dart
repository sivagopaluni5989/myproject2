import 'package:shared_preferences/shared_preferences.dart';


class PinService {


  static const String _pinKey = "security_pin";



  Future<void> savePin(String pin) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _pinKey,
      pin,
    );

  }




  Future<bool> verifyPin(String pin) async {

    final prefs = await SharedPreferences.getInstance();

    final savedPin = prefs.getString(_pinKey);


    if (savedPin == null) {

      return false;

    }


    return savedPin == pin;

  }




  Future<bool> hasPin() async {

    final prefs = await SharedPreferences.getInstance();


    return prefs.containsKey(_pinKey);

  }



  Future<void> removePin() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_pinKey);

  }

}
