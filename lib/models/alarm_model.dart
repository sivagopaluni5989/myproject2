class AlarmModel {

  final String name;
  final String soundPath;
  final bool enabled;

  AlarmModel({
    required this.name,
    required this.soundPath,
    this.enabled = true,
  });


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "soundPath": soundPath,
      "enabled": enabled,
    };
  }


  factory AlarmModel.fromJson(Map<String, dynamic> json) {

    return AlarmModel(
      name: json["name"] ?? "",
      soundPath: json["soundPath"] ?? "",
      enabled: json["enabled"] ?? true,
    );

  }

}
