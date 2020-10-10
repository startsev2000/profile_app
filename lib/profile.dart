import 'package:flutter/material.dart';

class Profile {
  AssetImage image;
  String name;
  String surname;
  String description;
  int age;
  String education;
  String job;
  String city;
  List<String> information;

  Profile(
      {this.image,
      this.name,
      this.surname,
      this.description,
      this.age,
      this.education,
      this.job,
      this.city,
      this.information});

  Map<String, dynamic> _toMap() {
    return {
      'name': name,
      'surname': surname,
      'description': description,
      'age': age,
      'education': education,
      'job': job,
      'city': city,
      'information': information
    };
  }

  dynamic get(String propertyName) {
    var _mapRep = _toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('Property not found');
  }

  dynamic checkDescription() {
    if (this.description == '') {
      description = '[a hilarious description here]';
    }
    return description;
  }
}
