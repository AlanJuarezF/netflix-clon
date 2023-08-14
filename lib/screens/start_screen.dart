import 'package:flutter/material.dart';
import 'package:netflix_clon/widgets/suggestions_card.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VCT Tv',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recomendado para ti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SuggestionCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              label: 'Juegos Completos',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              label: 'Reaciones',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              label: 'Voice Comms',
              backgroundColor: Colors.red),
        ],
        backgroundColor: Colors.amber,
        onTap: null,
      ),
    );
  }
}
