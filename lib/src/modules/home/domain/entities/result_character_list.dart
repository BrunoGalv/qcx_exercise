import 'package:qcx_exercise/src/modules/character_details/domain/entities/character.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/info_list.dart';

class ResultCharacterList{
  final InfoList info;
  final List<Character> characterList;

  ResultCharacterList({
    required this.info,
    required this.characterList,
  });
}