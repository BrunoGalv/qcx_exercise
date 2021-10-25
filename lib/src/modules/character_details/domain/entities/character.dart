import 'package:qcx_exercise/src/modules/character_details/domain/entities/character_origin.dart';
import 'package:qcx_exercise/src/modules/character_details/infra/models/character_location_model.dart';

class Character{
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterOrigin origin;
  final CharacterLocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character(
      this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created);
}