import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickyandmorty/component/character_list.dart';
import 'package:rickyandmorty/provider/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();
  bool isloading = false;
  int Page = 1;
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<Apiprovider>(context, listen: false);
    apiProvider.getCharacters(Page);
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isloading = true;
        });
        Page++;
        await apiProvider.getCharacters(Page);
        setState(() {
          isloading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<Apiprovider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rick And Morty',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: apiProvider.character.isNotEmpty
              ? CharacterList(
                  apiProvider: apiProvider,
                  scrollController: scrollController,
                  isloading: isloading,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}

