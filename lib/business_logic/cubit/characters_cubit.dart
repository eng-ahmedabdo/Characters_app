import 'package:bloc/bloc.dart';
import 'package:character_app/data/model/character.dart';
import 'package:character_app/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters) {
       emit(CharactersLoaded(characters));
       this.characters = characters;
    });
    return characters;
  }
}
