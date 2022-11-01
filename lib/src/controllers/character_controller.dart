import 'package:api_harry_potter_flutter/src/models/character_model.dart';
import 'package:api_harry_potter_flutter/src/service/character_service.dart';

class CharacterController {
  final CharacterService service;

  const CharacterController({required this.service});

  Future<List<Character>> getCharacters() async {
    try {
      final response = await service.getCharacters();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
