import 'dart:convert';

import 'package:track_medical/src/models/allergy_model.dart';
import 'package:track_medical/src/models/secure_model.dart';

Pacient pacientFromJson(String str) => Pacient.fromJson(json.decode(str));
String pacientToJson(Pacient data) => json.encode(data.toJson());

class Pacient {
  Pacient({
     this.name,
      this.surname,
    this.placeOfBirth,
     this.dateOfBirth,
    this.allergies,
    this.secure,
  });

  String name;
  String surname;
  String  placeOfBirth;
  DateTime dateOfBirth;
  List<Allergy> allergies;
  Secure  secure;

  factory Pacient.fromJson(Map<String, dynamic> json) => Pacient(
        name: json["name"],
        surname: json["surname"],
        placeOfBirth: json["placeOfBirth"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        allergies: List<Allergy>.from(
            json["allergies"].map((x) => Allergy.fromJson(x))),
        secure: Secure.fromJson(json["secure"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "placeOfBirth": placeOfBirth,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
        "secure": secure?.toJson(),
      };
}
