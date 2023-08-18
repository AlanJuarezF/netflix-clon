import 'package:flutter/material.dart';
import 'package:netflix_clon/model/item.dart';
import 'package:netflix_clon/screens/player_screen.dart';

class SuggestionCard extends StatefulWidget {
  final Item item;

  const SuggestionCard({super.key, required this.item});

  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 550,
          height: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlayerScreen(url: widget.item.url.toString())));
                // url: "https://www.youtube.com/watch?v=X4XT1Pd22Jc")));
              },
              child: Image(
                image: AssetImage(widget.item.mini
                    .toString()), // image: AssetImage('assets/images/starts.jpg'),
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 150,
              child: Text(
                widget.item.title.toString(), // 'VCT 2023',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              width: 305,
              height: 120,
              child: Text(
                widget.item.title
                    .toString(), // "Revive los mejores momentos de la VCT 2023",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: Text(
                'Fecha: ${widget.item.date.toString()}', //11/08/2023",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: Text(
                'Duración: ${widget.item.duration.toString()}', //11:26",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
