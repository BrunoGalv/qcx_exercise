import 'package:dartz/dartz.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/errors/errors.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';

abstract class HomeRepository{
  Future<Either<HomeException, ResultCharacterList>> loadCharacters(PaginationParams params);
}