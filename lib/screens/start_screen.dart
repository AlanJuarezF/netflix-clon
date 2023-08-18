import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clon/model/items.dart';
import 'package:netflix_clon/screens/list_screen.dart';
import 'package:netflix_clon/widgets/suggestions_card.dart';

import '../model/item.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  Items _itemsGames = Items();
  Items _itemsReacion = Items();
  Items _itemsVoicecomms = Items();
  int _randomIndex = 0;
  int _selectedIndex = 0;

  Future<void> readJson(String fileName, String key, Function callback) async {
    try {
      //print('Reading $fileName.json');
      final String response =
          await rootBundle.loadString('assets/jsons/$fileName.json');
      final data = await json.decode(response);
      //print('Data from $fileName.json: $data');
      //print('Data from $fileName.json has ${data[key].length} items');
      callback(data[key]);
      // setState(() {
      //   callback(data[key]);
      // });
      //print('Finished reading $fileName.json');
      if (data[key].isEmpty) {
        print('$key list is empty');
      } else if (!data[key][0].containsKey('title')) {
        print('First element in $key list does not have a title property');
      } else {
        // Access the title property here
        print(data[key][0]['title']);
      }
    } catch (e) {
      print('Error while reading $fileName.json: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    // Getting a random index of the items for the recommendations
    Random random = Random();
    _randomIndex = random.nextInt(2) + 1;
  }

  @override
  Widget build(BuildContext context) {
    Items itemsSelected = Items();
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
          children: [
            Text(
              'Recomendado para ti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Future.wait([
                readJson('games', 'games',
                    (data) => _itemsGames = Items.fromJsonList(data)),
                readJson('reacion', 'episodes',
                    (data) => _itemsReacion = Items.fromJsonList(data)),
                readJson('voicecomms', 'items',
                    (data) => _itemsVoicecomms = Items.fromJsonList(data)),
              ]).catchError((error) {
                // Maneja el error aquí
                //print(error);
                return [];
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // Muestra un mensaje de error
                    return const Text('Ocurrió un error al cargar los datos');
                  } else {
                    //print(_itemsGames.items[1].title);
                    return SuggestionCard(
                        item: _itemsGames.items[_randomIndex]);
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
        onTap: (index) {
          print('index: $index');

          if (index == 0) {
            itemsSelected = _itemsGames;
          } else if (index == 1) {
            itemsSelected = _itemsReacion;
          } else if (index == 2) {
            itemsSelected = _itemsVoicecomms;
          }
          setState(() {
            _selectedIndex = index;
            itemsSelected = itemsSelected;
          });
          print('SelectedIndex: $_selectedIndex');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListScreen(listItems: itemsSelected)));
          //Navigator.of(context).pushNamed('ListScreen', arguments: itemsSelected);
        },
      ),
    );
  }
}
