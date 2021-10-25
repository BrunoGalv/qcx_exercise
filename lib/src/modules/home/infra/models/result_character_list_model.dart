import 'dart:convert';
import 'package:qcx_exercise/src/modules/character_details/domain/entities/character.dart';
import 'package:qcx_exercise/src/modules/character_details/infra/models/character_model.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/infra/models/info_list_model.dart';

class ResultCharacterListModel extends ResultCharacterList {
  final List<CharacterModel> characterList;
  final InfoListModel info;

  ResultCharacterListModel(
      {
        required this.characterList,
        required this.info
      }) : super(info: InfoListModel(count: 0, pages: 0,), characterList: []);

  Map<String, dynamic> toMap() {
    return {
      'characterList': this.characterList.map((e) => e.toMap()).toList(),
      'info': this.info.toMap(),
    };
  }

  static ResultCharacterListModel fromMap(Map<String, dynamic> map) {
    return ResultCharacterListModel(
      characterList: map['results'].map((e) => CharacterModel.fromMap(e)).toList()?.cast<CharacterModel>() as List<CharacterModel>,
      info: InfoListModel.fromMap(map['info']),
    );
  }

  String toJson() => json.encode(toMap());

  static ResultCharacterListModel fromJson(String source) => fromMap(jsonDecode(source));
}