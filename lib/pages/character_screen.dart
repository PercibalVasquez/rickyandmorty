import 'package:flutter/material.dart';
import 'package:rickyandmorty/component/card_data.dart';
import 'package:rickyandmorty/component/listado_episodios.dart';
import 'package:rickyandmorty/models/character_model.dart';

class CharacterScreen extends StatelessWidget {
  final Character character;
  CharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name!),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.35,
              width: double.infinity,
              child: Hero(
                tag: character.id!,
                child: Image.network(
                  character.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: size.height * 0.14,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardData("Status :", character.status!),
                  cardData("Especie :", character.species!),
                  cardData("Origen :", character.origin!.name!),
                ],
              ),
            ),
            Text(
              'Episodio :',
              style: TextStyle(fontSize: 17),
            ),
            EpisodeList(size: size, character: character)
          ],
        ),
      ),
    );
  }
}
