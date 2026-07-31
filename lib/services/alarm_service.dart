import 'package:audioplayers/audioplayers.dart';

class AlarmService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playAlarm(String sound) async {
    await _player.stop();
    await _player.play(
      AssetSource(sound),
      volume: 1.0,
    );
  }

  Future<void> stopAlarm() async {
    await _player.stop();
  }

  Future<void> police() async {
    await playAlarm("alarms/police.mp3");
  }

  Future<void> ambulance() async {
    await playAlarm("alarms/ambulance.mp3");
  }

  Future<void> fire() async {
    await playAlarm("alarms/fire.mp3");
  }

  Future<void> emergency() async {
    await playAlarm("alarms/emergency.mp3");
  }

  Future<void> horn() async {
    await playAlarm("alarms/horn.mp3");
  }
}
