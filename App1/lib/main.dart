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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext) => MyHomePage(title: 'Root', lang: 'ja'),
        // '/en': (BuildContext) =>
        //     MyHomePage(title: 'Flutter Demo Home Page - English', lang: 'en'),
        '/Character': (BuildContext) =>
            MyHomePage(title: 'character', lang: 'ja'),
        '/Lily': (BuildContext) => MyHomePage(title: 'lily', lang: 'ja'),
        '/Teacher': (BuildContext) => MyHomePage(title: 'teacher', lang: 'ja'),
        '/Charm': (BuildContext) => MyHomePage(title: 'charm', lang: 'ja'),
        '/Corporation': (BuildContext) =>
            MyHomePage(title: 'corporation', lang: 'ja'),
        '/Taskforce': (BuildContext) =>
            MyHomePage(title: 'taskforce', lang: 'ja'),
        '/MediaContent': (BuildContext) =>
            MyHomePage(title: 'mediacontent', lang: 'ja'),
        '/Book': (BuildContext) => MyHomePage(title: 'book', lang: 'ja'),
        '/Game': (BuildContext) => MyHomePage(title: 'game', lang: 'ja'),
        '/Play': (BuildContext) => MyHomePage(title: 'play', lang: 'ja'),
        '/AnimeSeries': (BuildContext) =>
            MyHomePage(title: 'animeseries', lang: 'ja'),
        '/AnimeEpisode': (BuildContext) =>
            MyHomePage(title: 'animeepisode', lang: 'ja'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.lang})
      : super(key: key);
  final String title;
  final String lang;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _lily = [];

  void _getLilyByGarden(String garden) async {
    List<String> lilyList = await lily.queryLilyByGarden(garden, widget.lang);
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

  Widget _buildPushButton(String text, String iris) {
    return GestureDetector(
      onTap: () {
        lily.queryIRI(iris);
        Navigator.of(context).pushNamed('/' + iris);
      },
      child: Container(
        child: Row(
          children: [Icon(Icons.star), Text(text)],
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
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).pushNamed('/en');
                //   },
                //   child: Container(
                //     child: Row(
                //       children: [
                //         Icon(Icons.star),
                //         Text('Move to English Page')
                //       ],
                //     ),
                //     decoration: BoxDecoration(
                //       color: Colors.red.shade100,
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //     padding: const EdgeInsets.all(5),
                //     margin: const EdgeInsets.all(5),
                //   ),
                // ),
                _buildPushButton('登場人物', 'Character'),
                _buildPushButton('リリィ', 'Lily'),
                _buildPushButton('教導官', 'Teacher'),
                _buildPushButton('CHARM', 'Charm'),
                _buildPushButton('会社組織', 'Corporation'),
                _buildPushButton('臨時・特別部隊', 'Taskforce'),
                _buildPushButton('メディアミックスコンテンツ', 'MediaContent'),
                _buildPushButton('書籍', 'Book'),
                _buildPushButton('ゲーム', 'Game'),
                _buildPushButton('舞台作品', 'Play'),
                _buildPushButton('舞台作品', 'Play'),
                _buildPushButton('アニメシリーズ', 'AnimeSeries'),
                _buildPushButton('アニメエピソード', 'AnimeEpisode'),
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
