import 'package:flutter/material.dart';

class GameAreaWidget extends StatelessWidget {
  const GameAreaWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: PanelContainerWidget()),
            MenuWidget(),
          ],
        ),
      ),
    );
  }
}

class PanelContainerWidget extends StatelessWidget {
  const PanelContainerWidget({Key? key}) : super(key: key);
  void _initNumber() {}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [for (var i = 0; i < 81; i += 1) i]
          .map((int value) => PanelContentWidget(index: value, size: width))
          .toList(),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PanelContentWidget extends StatefulWidget {
  const PanelContentWidget({Key? key, required this.index, required this.size})
      : super(key: key);
  final int index;
  final double size;
  @override
  State<PanelContentWidget> createState() => _PanelContentWidgetState();
}

class _PanelContentWidgetState extends State<PanelContentWidget> {
  int _correctNumber = 0;
  int _inputNumber = 0;
  int _visualizedNumber = 0;
  Color _color = Colors.white70;

  void _PanelTapped() {
    setState(() {
      _color = Colors.black12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.size / 9 * ((widget.index ~/ 9) as double),
      left: widget.size / 9 * ((widget.index % 9) as double),
      width: widget.size / 9,
      height: widget.size / 9,
      child: GestureDetector(
        onTap: _PanelTapped,
        child: Container(
          alignment: Alignment(0.0, 0.0),
          color: _color,
          child: Text('${_visualizedNumber}'),
        ),
      ),
    );
  }
}

/* ========================================================================== */

// class PanelWidget extends StatefulWidget {
//   const PanelWidget({Key? key, required this.number, required this.size})
//       : super(key: key);
//   final int number;
//   final Color color = Colors.white70;
//   final double size;
//
//   @override
//   State<PanelWidget> createState() => _PanelWidgetState();
// }

// class _PanelWidgetState extends State<PanelWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 10 + widget.size / 9 * ((widget.number ~/ 9) as double),
//       left: 10 + widget.size / 9 * ((widget.number % 9) as double),
//       width: widget.size / 9,
//       height: widget.size / 9,
//       child: Container(
//         alignment: Alignment(0.0, 0.0),
//         color: widget.color,
//         child: Text('${widget.number}'),
//       ),
//     );
//   }
// }
