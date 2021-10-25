import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/home_usecase.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/external/datasources/api_datasource.dart';
import 'package:qcx_exercise/src/modules/home/infra/models/info_list_model.dart';
import 'package:qcx_exercise/src/modules/home/infra/repositories/home_repository_impl.dart';
import 'package:qcx_exercise/src/modules/home/presenter/bloc/home_bloc.dart';
import 'package:qcx_exercise/src/modules/home/presenter/bloc/states/state.dart';
import 'package:qcx_exercise/src/network/custom_dio.dart';

void main(){
  final datasource = ApiDatasource(CustomDio().client);
  final usecase = HomeUsecase(HomeRepositoryImpl(datasource));
  final bloc = HomeBloc(usecase);

  test("Deverá retornar os States", (){

    bloc.add(false);
    expect(bloc.stream, emitsInOrder([
      isA<LoadingCharacters>(),
      isA<LoadCharacterSuccess>(),
    ]));
  });
}