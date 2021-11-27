import 'package:flutter/material.dart';

import 'pages/place.dart';
import 'pages/random_words.dart';

void main(List<String> args) {
  runApp(const DemosApp());
}

class DemosApp extends StatelessWidget {
  const DemosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demos',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demos'),
        ),
        body: const DemosList(),
      ),
    );
  }
}

class DemosList extends StatelessWidget {
  const DemosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buldRow(
          context,
          "RandomWordsPage",
          (context) => const RandomWordsPage(),
        ),
        const Divider(),
        _buldRow(
          context,
          "Place",
          (context) => PlacePage(),
        ),
      ],
    );
  }

  Widget _buldRow(
    BuildContext context,
    String title,
    WidgetBuilder destBuilder,
  ) {
    return GestureDetector(
      child: ListTile(title: Text(title)),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: destBuilder));
      },
    );
  }
}
