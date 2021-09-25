import 'package:flutter/material.dart';
import 'lily.dart' as lily;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "NotoSansCJK-Medium",
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _lily = [];

  void _getLilyByGarden(String garden) async {
    List<String> lilyList = await lily.queryLilyByGarden(garden);
    setState(() {
      _lily = [];
      lilyList.forEach((var l) {
        _lily.add(_buildContainer(l, Colors.white));
      });
    });
  }

  Container _buildContainer(String value, Color color) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.star),
          Text(value),
        ],
      ),
      color: color,
      padding: const EdgeInsets.all(5),
    );
  }

  Widget _buildButton(String garden, var onPressed) {
    return GestureDetector(
      onTap: () {
        onPressed(garden);
      },
      child: Container(
        child: Row(
          children: [Icon(Icons.star), Text(garden)],
        ),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
                _buildButton('私立百合ヶ丘女学院', _getLilyByGarden),
                _buildButton('私立ルドビコ女学院', _getLilyByGarden),
                _buildButton('御台場女学校', _getLilyByGarden),
                _buildButton('神庭女子藝術高校', _getLilyByGarden),
                _buildButton('エレンスゲ女学園', _getLilyByGarden),
              ] +
              _lily,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getLilyYurigaoka,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
