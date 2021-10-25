import 'package:dartz/dartz.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/errors/errors.dart';
import 'package:qcx_exercise/src/modules/home/domain/repositories/home_repository.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/infra/datasources/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository{
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Either<HomeException, ResultCharacterList>> loadCharacters(PaginationParams params) async {
    try{
      final characterList = await dataSource.loadCharacters(params);
      return Right(characterList);
    } on HomeException catch (e){
      return Left(e);
    } on Exception catch (e) {
      return Left(HomeException("Exception Error"));
    }
  }

}