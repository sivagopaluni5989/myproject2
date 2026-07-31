class SecurityEventModel {

  final String type;
  final String time;
  final String message;

  SecurityEventModel({
    required this.type,
    required this.time,
    required this.message,
  });


  Map<String, dynamic> toJson() {

    return {

      "type": type,
      "time": time,
      "message": message,

    };

  }


  factory SecurityEventModel.fromJson(
      Map<String, dynamic> json) {

    return SecurityEventModel(

      type: json["type"] ?? "",

      time: json["time"] ?? "",

      message: json["message"] ?? "",

    );

  }

}

