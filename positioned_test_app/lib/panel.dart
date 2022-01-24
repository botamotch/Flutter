import 'package:flutter/material.dart';
import 'dart:math';

class GameAreaWidget extends StatelessWidget {
  const GameAreaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: PanelContainerWidget()),
          Expanded(child: MenuWidget()),
          // PanelContainerWidget(),
          // MenuWidget(),
        ],
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);
  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Positioned> _positionList = [
      for (int i = 0; i < 9; i += 1)
        Positioned(
            top: 10,
            left: width / 9 * (i as double),
            width: width / 9,
            height: width / 9,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment(0.0, 0.0),
                // color: Colors.blueGrey,
                child: Text('$i'),
              ),
            ))
    ];
    return Stack(
      fit: StackFit.expand,
      children: _positionList,
    );
    // return Container(child: Text('hello'));
  }
}

class PanelContainerWidget extends StatefulWidget {
  const PanelContainerWidget({Key? key}) : super(key: key);

  static List<int> correctNumber = [
    for (int i = 0; i < 81; i += 1) Random().nextInt(9) + 1
  ];
  static List<int> inputNumber = [];
  static List<bool> visible = [];

  @override
  State<PanelContainerWidget> createState() => _PanelContainerWidgetState();
}

class _PanelContainerWidgetState extends State<PanelContainerWidget> {
  List<PanelContentWidget> panelList = [for (var i = 0; i < 81; i += 1) i]
      .map((int i) => PanelContentWidget(
            color: Colors.white70,
            number: PanelContainerWidget.correctNumber[i],
          ))
      .toList();

  void _initNumber() {
    setState(() {
      panelList = [for (int i = 0; i < 81; i += 1) i]
          .map((int i) => PanelContentWidget(
                color: Colors.white70,
                number: PanelContainerWidget.correctNumber[i],
              ))
          .toList();
    });
  }

  void _resetColor(int index) {
    setState(() {
      panelList = [for (int i = 0; i < 81; i += 1) i]
          .map((int i) => PanelContentWidget(
                color: (i != index) ? Colors.white70 : Colors.black12,
                number: PanelContainerWidget.correctNumber[i],
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    List<Positioned> _positionList = [];
    panelList.asMap().forEach((int i, PanelContentWidget p) {
      _positionList.add(Positioned(
        top: width / 9 * ((i ~/ 9) as double),
        left: width / 9 * ((i % 9) as double),
        width: width / 9,
        height: width / 9,
        child: GestureDetector(
          onTap: () {
            _resetColor(i);
          },
          child: p,
        ),
      ));
    });
    _initNumber();

    return Stack(
      fit: StackFit.expand,
      children: _positionList,
    );
  }
}

class PanelContentWidget extends StatelessWidget {
  const PanelContentWidget(
      {Key? key, required this.color, required this.number})
      : super(key: key);

  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      color: color,
      child: Text('$number'),
    );
  }
}
