import 'package:character_app/business_logic/cubit/characters_cubit.dart';
import 'package:character_app/constants/strings.dart';
import 'package:character_app/data/model/character.dart';
import 'package:character_app/data/repository/characters_repository.dart';
import 'package:character_app/data/web_services/characters_web_services.dart';
import 'package:character_app/presentation/screens/character_details_screen.dart';
import 'package:character_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: const CharacterScreen(),
          ),
        );

      case characterDetailScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailScreen(character: character,),);
    }
  }
}
