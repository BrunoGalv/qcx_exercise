import 'package:dartz/dartz.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/errors/errors.dart';
import 'package:qcx_exercise/src/modules/home/domain/repositories/home_repository.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';

abstract class IHomeUsecase{
  Future<Either<HomeException, ResultCharacterList>> call(PaginationParams params);
}

class HomeUsecase implements IHomeUsecase{
  final HomeRepository homeRepository;

  HomeUsecase(this.homeRepository);

  @override
  Future<Either<HomeException, ResultCharacterList>> call(PaginationParams params) async{
    if(params.next == null){
      return Left(HomeException("Não há mais personagens."));
    }

    return await homeRepository.loadCharacters(params);
  }
}