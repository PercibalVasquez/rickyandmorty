import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickyandmorty/provider/api_provider.dart';


class CharacterList extends StatelessWidget {
  final Apiprovider apiProvider;
  final ScrollController scrollController;
  bool isloading = false;
  CharacterList(
      {super.key,
      required this.apiProvider,
      required this.scrollController,
      required this.isloading});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.87,
      ),
      itemCount: isloading
          ? apiProvider.character.length + 2
          : apiProvider.character.length,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        final character = apiProvider.character[index];
        if (index < apiProvider.character.length) {
          return GestureDetector(
            onTap: () {
              context.go('/character', extra: character);
            },
            child: Card(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Hero(
                    tag: character.id!,
                    child: FadeInImage(
                        placeholder: const AssetImage('assets/images/portal.gif'),
                        image: NetworkImage(character.image!)),
                  ),
                ),
                Text(
                  character.name!,
                  style: const TextStyle(
                      fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
              ],
            )),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
