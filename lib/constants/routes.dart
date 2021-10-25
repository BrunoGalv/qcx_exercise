import 'package:qcx_exercise/src/modules/character_details/character_details_module.dart';
import 'package:qcx_exercise/src/modules/character_details/presenter/ui/character_page.dart';
import 'package:qcx_exercise/src/modules/home/home_module.dart';
import 'package:qcx_exercise/src/modules/home/presenter/ui/home_page.dart';

class Routes{
  static const home_module = HomeModule.routeName;
  static const home_page = HomePage.routeName;

  static const character_module = CharacterDetailsModule.routeName;
  static const character_page = CharacterPage.routeName;
}