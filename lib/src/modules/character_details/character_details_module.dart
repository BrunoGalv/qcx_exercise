import 'package:flutter_modular/flutter_modular.dart';
import 'package:qcx_exercise/constants/routes.dart';
import 'package:qcx_exercise/src/modules/character_details/presenter/ui/character_page.dart';

class CharacterDetailsModule extends Module{
  static const String routeName = '/character';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Routes.home_page, child: (context, args) => CharacterPage(character: args.data)),
  ];
}