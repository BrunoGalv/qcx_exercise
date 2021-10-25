import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/errors/errors.dart';

abstract class LoadCharacterState {

}

class LoadCharacterStart implements LoadCharacterState {}

class LoadingCharacters implements LoadCharacterState {}

class LoadingMoreCharacters implements LoadCharacterState {}

class LoadCharacterSuccess implements LoadCharacterState{
  final ResultCharacterList result;

  LoadCharacterSuccess(this.result);
}

class LoadCharacterError implements LoadCharacterState {
  final HomeException error;

  LoadCharacterError(this.error);
}