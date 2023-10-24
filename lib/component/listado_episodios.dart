import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickyandmorty/models/character_model.dart';
import 'package:rickyandmorty/provider/api_provider.dart';

class EpisodeList extends StatefulWidget {
  final Size size;
  final Character character;
  const EpisodeList({super.key, required this.size, required this.character});

  @override
  State<EpisodeList> createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final apiProvider = Provider.of<Apiprovider>(context, listen: false);
    apiProvider.getEpisode(widget.character);
  }
  @override
  Widget build(BuildContext context) {
        final apiProvider = Provider.of<Apiprovider>(context);
    return SizedBox(
      height: widget.size.height * 0.35,
      child: ListView.builder(
        itemCount: apiProvider.episodes.length,
        itemBuilder: (context, index) {
          final episodios = apiProvider.episodes[index];
          return ListTile(
            leading: Text(episodios.episode!),
            title: Text(episodios.name!),
            trailing: Text(episodios.airDate!),
          );
        },
      ),
    );
  }
}