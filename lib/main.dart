import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickyandmorty/pages/character_screen.dart';
import 'package:rickyandmorty/pages/home_scrren.dart';
import 'package:rickyandmorty/provider/api_provider.dart';
import 'package:rickyandmorty/models/character_model.dart';

void main() => runApp(const MyApp());
final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomeScreen();
    },
    routes: [
      GoRoute(
        path: 'Character',
        builder: (context, state) {
          final character = state.extra as Character;
          return CharacterScreen(character: character);
        },
      ),
    ],
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Apiprovider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'The Rick and Morty APP',
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        routerConfig: _router,
      ),
    );
  }
}
