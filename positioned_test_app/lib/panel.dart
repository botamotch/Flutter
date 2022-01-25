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
          // Expanded(child: MenuWidget()),
        ],
      ),
    );
  }
}

class PanelContainerWidget extends StatefulWidget {
  const PanelContainerWidget({Key? key}) : super(key: key);
  @override
  State<PanelContainerWidget> createState() => _PanelContainerWidgetState();
}

class _PanelContainerWidgetState extends State<PanelContainerWidget> {
  int selectedPanel = 0;
  List<int> inputNumber = [];
  List<bool> selectable = [];
  List<int> correctNumber = [];
  List<PanelContentWidget> panelList = [];

  void setNumber(var j) {
    setState(() {
      inputNumber[selectedPanel] = j;
    });
  }

  void checkAnswer() {}
  void selectPanel(var i) {
    setState(() {
      selectedPanel = i;
    });
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 81; i += 1) {
      correctNumber.add(Random().nextInt(9) + 1);
      selectable.add(i > 40 ? true : false);
      inputNumber.add(0);
      panelList.add(PanelContentWidget(
        color: selectable[i] ? Colors.white70 : Colors.black12,
        number: selectable[i] ? inputNumber[i] : correctNumber[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    List<Positioned> _positionList = [];
    // Panel
    for (var i = 0; i < 81; i += 1) {
      panelList[i] = PanelContentWidget(
        color: (i == selectedPanel) ? Colors.black12 : Colors.white70,
        number: selectable[i] ? inputNumber[i] : correctNumber[i],
      );
      _positionList.add(Positioned(
        top: width / 9 * (i ~/ 9),
        left: width / 9 * (i % 9),
        width: width / 9,
        height: width / 9,
        child: GestureDetector(
          onTap: () {
            selectPanel(i);
          },
          child: panelList[i],
        ),
      ));
    }
    // Button
    for (var i = 0; i < 9; i += 1) {
      _positionList.add(Positioned(
        top: width,
        left: width / 9 * (i % 9),
        width: width / 9,
        height: width / 9,
        child: GestureDetector(
          onTap: () {
            setNumber(i + 1);
          },
          child: PanelContentWidget(
            color: Colors.black12,
            number: (i + 1),
          ),
        ),
      ));
    }
    _positionList.add(Positioned(
      top: width * (1 + 1 / 9),
      left: 0,
      width: width,
      height: width / 10,
      child: GestureDetector(
        onTap: () {
          setNumber(0);
        },
        child: PanelContentWidget(color: Colors.black12, number: 0),
      ),
    ));

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
      child: Text(number != 0 ? '$number' : ''),
    );
  }
}
