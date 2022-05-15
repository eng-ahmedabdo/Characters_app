import 'package:character_app/constants/my_colors.dart';
import 'package:character_app/data/model/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: Text(
          character.nickName,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }



  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Job : " , character.jobs.join(" / ")),
                      buildDivider(285),
                      characterInfo("Appeared in : " , character.categoryForTwoSeries),
                      buildDivider(220),
                      characterInfo("Seasons : " , character.appearanceOfSeasons.join(" / ")),
                      buildDivider(250),
                      characterInfo("Status : " , character.statusIfDeadOrAlive),
                      buildDivider(265),
                      character.betterCallSaulAppearance.isEmpty ? Container() :
                      characterInfo("Better Call Saul Season : " , character.betterCallSaulAppearance.join(" / ")),
                      character.betterCallSaulAppearance.isEmpty ? Container() :
                      buildDivider(130),
                      characterInfo("Actor/Actress : " , character.actorName),
                      buildDivider(205),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
                const SizedBox(height: 350,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
