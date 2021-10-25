import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/errors/errors.dart';
import 'package:qcx_exercise/src/modules/home/domain/repositories/home_repository.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/home_usecase.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/infra/models/info_list_model.dart';

class HomeRepositoryMock implements HomeRepository{
  @override
  Future<Either<HomeException, ResultCharacterList>> loadCharacters(PaginationParams params) async{
    if(params.page < 0){
      return Left(HomeException("Repository Error"));
    }
    return Right(ResultCharacterList(info: InfoListModel(pages: 0, count: 0), characterList: []));
  }
}

void main(){
  final repository = HomeRepositoryMock();
  final usecase = HomeUsecase(repository);

  test("Deverá dar erro no Repository  ...", () async {
    final result = await usecase(PaginationParams(page: -1));

    expect(result.isLeft(), true);
  });

  test("Deverá dar erro ao não ter uma prox página  ...", () async {
    final result = await usecase(PaginationParams(page: 1));

    expect(result.isLeft(), true);
  });

  test("Deverá retornar a lista de personagens ...", () async {
    final result = await usecase(PaginationParams(page: 1, next: ""));

    expect(result.isRight(), true);
    expect(result.getOrElse(() => ResultCharacterList(info: InfoListModel(pages: 0, count: 0), characterList: [])).characterList, []);
  });
}