import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: const Image(
            image: AssetImage('assets/images/start.jpg'),
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'VCT 2023',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'Revive los mejores momentos de la VCT 2023',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'Duracion: 12:56',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
        )
      ],
    );
  }
}
