import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';

abstract class HomeDataSource {
  Future<ResultCharacterList> loadCharacters(PaginationParams params);
}