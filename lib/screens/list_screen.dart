import 'package:flutter/material.dart';
import 'package:netflix_clon/model/items.dart';
import 'package:netflix_clon/widgets/mini_card.dart';

class ListScreen extends StatefulWidget {
  final Items listItems;

  const ListScreen({super.key, required this.listItems});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Regresar',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: widget.listItems.items.length,
          itemBuilder: (BuildContext context, int index) {
            return MiniCard(item: widget.listItems.items[index]);
          }),
    );
  }
}
