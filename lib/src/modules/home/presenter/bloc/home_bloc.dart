import 'package:bloc/bloc.dart';
import 'package:qcx_exercise/src/modules/home/domain/entities/result_character_list.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/home_usecase.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/infra/models/info_list_model.dart';
import 'package:qcx_exercise/src/modules/home/presenter/bloc/states/state.dart';

class HomeBloc extends Bloc<bool, LoadCharacterState> {

  final IHomeUsecase usecase;
  var params = PaginationParams(page: 1, next: "");
  ResultCharacterList resultCharacterList = ResultCharacterList(info: InfoListModel(count: 0, pages: 0), characterList: []);

  HomeBloc(this.usecase) : super(LoadCharacterStart()){
    on<bool>(loadCharacters);
  }

  Future loadCharacters(bool more, Emitter<LoadCharacterState> emit) async {
    if(more){
      emit(LoadingMoreCharacters());
    }else{
      emit(LoadingCharacters());
    }

    final result = await usecase(params);
    emit(result.fold((l) => LoadCharacterError(l), (r) {
      params = PaginationParams(page: params.page + 1, next: r.info.next);
      resultCharacterList.characterList.addAll(r.characterList);
      resultCharacterList = ResultCharacterList(info: r.info, characterList: resultCharacterList.characterList);
      return LoadCharacterSuccess(resultCharacterList);
    }));
  }
}