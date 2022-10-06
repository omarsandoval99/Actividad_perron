import 'dart:convert';

class Dogs {
  Dogs({
    required this.raza,
  });

  List<String> raza;

  factory Dogs.fromJson(String str) => Dogs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dogs.fromMap(Map<String, dynamic> json) => Dogs(
        raza: List<String>.from(json["bulldog"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "bulldog": List<dynamic>.from(raza.map((x) => x)),
      };
}
