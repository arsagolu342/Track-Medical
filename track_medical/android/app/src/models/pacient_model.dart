// To parse this JSON data, do
//
//     final pacient = pacientFromJson(jsonString);

import 'dart:convert';
import 'allergy_model.dart';
Pacient pacientFromJson(String str) => Pacient.fromJson(json.decode(str));
String pacientToJson(Pacient data) => json.encode(data.toJson());

class Pacient {
    Pacient({
      this.name,
        this.sername,
        this.placeOfBrith,
        this.dateOfBrith,
        this.allergies,
        this.secure,
    });

    String name;
    String sername;
    String placeOfBrith;
    DateTime dateOfBrith;
    List<Allergy> allergies;
    String secure;

    factory Pacient.fromJson(Map<String, dynamic> json) => Pacient(
        name: json["name"],
        sername: json["sername"],
        placeOfBrith: json["placeOfBrith"],
        dateOfBrith: DateTime.parse(json["dateOfBrith"]),
        allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromJson(x))),
       secure: json["placeOfBrith"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "sername": sername,
        "placeOfBrith": placeOfBrith,
        "dateOfBrith": "${dateOfBrith.year.toString().padLeft(4, '0')}-${dateOfBrith.month.toString().padLeft(2, '0')}-${dateOfBrith.day.toString().padLeft(2, '0')}",
        "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
        "secure": secure,
    };
}

