import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcx_exercise/constants/app_colors.dart';
import 'package:qcx_exercise/src/modules/character_details/domain/entities/character.dart';

class CharacterPage extends StatefulWidget {
  static const String routeName = '/';

  final Character character;

  const CharacterPage({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        centerTitle: true,
        backgroundColor: AppColors.brand,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.brand
                ),
                child: Hero(
                  tag: widget.character.id,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.character.image,
                    ),
                    radius: 80.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.character.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: AppColors.black
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.character.status.toUpperCase(),
            style: TextStyle(
                fontSize: 16,
                color: AppColors.grey1
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.grey1,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.character.gender,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.brand_2
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Specie",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey1,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.character.species,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.brand_2
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Origin Location",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey1,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.character.origin.name,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.brand_2
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey1,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        widget.character.location.name,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.brand_2
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
