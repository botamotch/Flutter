import 'package:flutter/material.dart';

class PanelWidget extends StatefulWidget {
  const PanelWidget({Key? key, required this.number, required this.size})
      : super(key: key);
  final int number;
  final Color color = Colors.white70;
  final double size;

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10 + widget.size / 9 * ((widget.number ~/ 9) as double),
      left: 10 + widget.size / 9 * ((widget.number % 9) as double),
      width: widget.size / 9,
      height: widget.size / 9,
      child: Container(
        alignment: Alignment(0.0, 0.0),
        color: widget.color,
        child: Text('${widget.number}'),
      ),
    );
  }
}
