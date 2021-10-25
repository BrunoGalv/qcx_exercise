import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/errors/errors.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/infra/datasources/home_datasource.dart';
import 'package:qcx_exercise/src/modules/character_details/infra/models/character_model.dart';
import 'package:qcx_exercise/src/modules/home/infra/models/result_character_list_model.dart';

class ApiDatasource implements HomeDataSource{
  final Dio dio;

  ApiDatasource(this.dio);

  @override
  Future<ResultCharacterList> loadCharacters(PaginationParams params) async {
    final response = await dio.get("character?page=${params.page}");
    if(response.statusCode == 200){
      final resultCharacter = ResultCharacterListModel.fromMap(response.data);
      return ResultCharacterList(info: resultCharacter.info, characterList: resultCharacter.characterList);
    }else{
      throw HomeException("Repository Error");
    }
  }
}