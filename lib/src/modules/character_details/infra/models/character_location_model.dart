import 'dart:convert';
import 'package:qcx_exercise/src/modules/character_details/domain/entities/character_origin.dart';

class CharacterLocationModel extends CharacterOrigin {
  final String name;
  final String url;

  CharacterLocationModel(
      {required this.name,
        required this.url}) : super('', '');

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'url': this.url,
    };
  }

  static CharacterLocationModel fromMap(Map<String, dynamic> map) {
    return CharacterLocationModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  static CharacterLocationModel fromJson(String source) => fromMap(jsonDecode(source));
}