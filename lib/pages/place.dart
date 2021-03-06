import 'package:flutter/material.dart';

import '../extensions/widgets.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(title: const Text("place")),
      body: ListView(
        children: [
          Image.network(
            "https://raw.githubusercontent.com/flutter/website/master/examples/layout/lakes/step5/images/lake.jpg",
            fit: BoxFit.cover,
          ),
          _titleSection(),
          _buttonSection(color),
          _textSection,
        ],
      ),
    );
  }

  Container _titleSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Oeschinen Lake Campground",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Kandersteg, Switzerland",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ).expanded(),
        IconButton(
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
                if (_isFavorited) {
                  _favoriteCount += 1;
                } else {
                  _favoriteCount -= 1;
                }
              });
            },
            icon: Icon(_isFavorited ? Icons.star : Icons.star_border,
                color: Colors.red[500])),
        Text("$_favoriteCount")
      ],
    ).margin(const EdgeInsets.all(32));
  }

  Row _buttonSection(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(color, Icons.call, "CALL"),
        _buildButton(color, Icons.near_me, "ROUTE"),
        _buildButton(color, Icons.share, "SHARE"),
      ],
    );
  }

  Column _buildButton(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }

  final _textSection = const Text(
    'Lake Oeschinen lies at the foot of the Bl??emlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ).margin(const EdgeInsets.all(32));
}
