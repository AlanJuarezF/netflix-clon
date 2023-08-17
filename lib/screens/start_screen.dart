import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clon/widgets/suggestions_card.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List _itemsGames = [];
  List _itemsReacion = [];
  List _itemsVoicecomms = [];
  int _index = 0;

  Future<void> readGames() async {
    final String response =
        await rootBundle.loadString('assets/jsons/games.json');
    final data = await json.decode(response);
    setState(() {
      _itemsGames = data["games"];
      print('Número de games in setState: ${_itemsGames.length}');
    });
  }

  Future<void> readReaccion() async {
    final String response =
        await rootBundle.loadString('assets/jsons/reacion.json');
    final data = await json.decode(response);
    setState(() {
      _itemsReacion = data["episodes"];
    });
  }

  Future<void> readVoicecomms() async {
    final String response =
        await rootBundle.loadString('assets/jsons/voicecomms.json');
    final data = await json.decode(response);
    setState(() {
      _itemsVoicecomms = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readGames();
    // readRoad();
    // readFranchise();
    Random random = Random();
    _index = random.nextInt(2) + 1;
    print('Index: $_index');
    //print('Número de games: ${_itemsGames.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        title: Text(
          'VCT Tv',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Recomendado para ti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            const SuggestionCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_outlined),
              label: 'Juegos Completos',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_outlined),
              label: 'Reaciones',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.voice_chat),
              label: 'Voice Comms',
              backgroundColor: Colors.red),
        ],
        backgroundColor: Colors.redAccent,
        onTap: null,
      ),
    );
  }
}
