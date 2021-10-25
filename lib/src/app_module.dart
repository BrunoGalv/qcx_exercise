import 'package:flutter_modular/flutter_modular.dart';
import 'package:qcx_exercise/constants/routes.dart';
import 'package:qcx_exercise/src/modules/character_details/character_details_module.dart';
import 'package:qcx_exercise/src/modules/home/home_module.dart';
import 'package:qcx_exercise/src/network/custom_dio.dart';

class AppModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => CustomDio().client),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Routes.home_module, module: HomeModule()),
    ModuleRoute(Routes.character_module, module: CharacterDetailsModule()),
  ];
}