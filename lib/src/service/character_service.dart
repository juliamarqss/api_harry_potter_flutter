import 'dart:developer';
import 'package:api_harry_potter_flutter/src/models/character_model.dart';
import 'package:dio/dio.dart';

class CharacterService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://hp-api.herokuapp.com/api',
    headers: {
      'Content-type': 'application/json',
    },
  ));

  Future<List<Character>> getCharacters() async {
    try {
      final response = await dio.get('/characters');

      final data = List.from(response.data);

      final mapList = data.map((e) => Map<String, dynamic>.from(e)).toList();

      return mapList.map((e) => Character.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
