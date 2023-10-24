import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rickyandmorty/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:rickyandmorty/models/episode_model.dart';

class Apiprovider with ChangeNotifier {
  final url = 'https://rickandmortyapi.com/api/character'; // URL correcta
  List<Character> character = [];
  List<EpisodeModel> episodes =[];

  Future<void> getCharacters(int page) async {
    final result = await http.get(Uri.parse('$url?page=$page')); // Añade "?page=$page" a la URL
    final response = characterModelFromJson(result.body);
    character.addAll(response.results!);
    notifyListeners();
  }
  Future<List<EpisodeModel>> getEpisode(Character character) async{
    episodes =[];
    for(var i =0; i< character.episode!.length; i++){
      final result = await http.get(Uri.parse(character.episode![i]));
      final response = episodeModelFromJson(result.body);
      episodes.add(response);
      notifyListeners();
    }
    return episodes;
  }
}
