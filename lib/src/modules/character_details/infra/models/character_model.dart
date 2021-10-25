import 'dart:convert';

import 'package:qcx_exercise/src/modules/character_details/domain/entities/character.dart';
import 'package:qcx_exercise/src/modules/character_details/infra/models/character_location_model.dart';
import 'package:qcx_exercise/src/modules/character_details/infra/models/character_origin_model.dart';

class CharacterModel extends Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOriginModel origin;
  final CharacterLocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created}) : super(0, '', '', '', '', '', CharacterOriginModel(name: "", url: ""), CharacterLocationModel(name: "", url: ""), '', [], '', '');

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'status': this.status,
      'species': this.species,
      'type': this.type,
      'gender': this.gender,
      'origin': this.origin.toMap(),
      'location': this.location.toMap(),
      'image': this.image,
      'episode': this.episode,
      'url': this.url,
      'created': this.created,
    };
  }

  static CharacterModel fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      origin: CharacterOriginModel.fromMap(map['origin']),
      location: CharacterLocationModel.fromMap(map['location']),
      image: map['image'] as String,
      episode: map['episode']?.cast<String>() as List<String>,
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  static CharacterModel fromJson(String source) => fromMap(jsonDecode(source));
}