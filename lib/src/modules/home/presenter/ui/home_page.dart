import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qcx_exercise/constants/app_colors.dart';
import 'package:qcx_exercise/constants/routes.dart';
import 'package:qcx_exercise/constants/size_config.dart';
import 'package:qcx_exercise/src/modules/home/domain/usecases/pagination_params.dart';
import 'package:qcx_exercise/src/modules/home/presenter/bloc/home_bloc.dart';
import 'package:qcx_exercise/src/modules/home/presenter/bloc/states/state.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    bloc.add(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(title: Text("Rick and Morty"), centerTitle: true,),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: BlocBuilder<HomeBloc, LoadCharacterState>(
                bloc: bloc,
                builder: (context, state) {
                  if(state is LoadingCharacters || state is LoadCharacterStart){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if(state is LoadCharacterError && state.error.message != "Não há mais personagens."){
                    return Center(
                      child: Text(state.error.message),
                    );
                  }

                  final characterList = bloc.resultCharacterList.characterList;

                  return ListView.builder(
                      itemCount: characterList.length,
                      itemBuilder: (context, index){
                        final item = characterList[index];
                        if(characterList.length - 1 == index && bloc.params.page <= bloc.resultCharacterList.info.pages) {
                          bloc.add(true);
                        }

                        return InkWell(
                          onTap: (){
                            Modular.to.pushNamed(Routes.character_module, arguments: item);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Hero(
                                    tag: item.id,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        item.image,
                                      ),
                                      radius: 40.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.status,
                                      ),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.black
                                        ),
                                      ),
                                      Text(
                                        "${item.species}, ${item.gender}",
                                        style: TextStyle(color: AppColors.grey1),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
