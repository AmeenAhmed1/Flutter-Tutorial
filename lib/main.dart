import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      title: "Welcome to flutter",
      home: Scaffold(
          appBar: AppBar(
            title: Text("English Generator"),
          ),
          body: new RandomWords()),
    );
  }
}

class RandomWordState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];

  final TextStyle _biggestFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestion(),
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggestFont,
      ),
    );
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        if (i.isNegative) return new Divider();

        final int index = i ~/ 2; //Modlus

        if (index >= _suggestions.length)
          _suggestions.addAll(generateWordPairs().take(10));

        return _buildRow(_suggestions[index]);
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => new RandomWordState();
}
