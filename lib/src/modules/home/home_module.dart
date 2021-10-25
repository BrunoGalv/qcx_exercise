import 'package:flutter_modular/flutter_modular.dart';
import 'package:qcx_exercise/constants/routes.dart';
import 'package:qcx_exercise/src/modules/home/presenter/ui/home_page.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/home_usecase.dart';
import 'package:qcx_exercise/src/modules/home/external/datasources/api_datasource.dart';
import 'package:qcx_exercise/src/modules/home/infra/repositories/home_repository_impl.dart';
import 'package:qcx_exercise/src/modules/home/presenter/bloc/home_bloc.dart';

class HomeModule extends Module{
  static const String routeName = '/';

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => ApiDatasource(i())),
    Bind.factory((i) => HomeRepositoryImpl(i())),
    Bind.factory((i) => HomeUsecase(i())),
    Bind.singleton((i) => HomeBloc(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Routes.home_page, child: (context, args) => const HomePage())
  ];
}