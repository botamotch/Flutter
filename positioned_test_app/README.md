# positioned_test

Positioned Test

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


こんな感じで実装。
selectPanel, setNumberは済。
次はcheckAnswer, initStateに手を付ける。

``` lib/panel.dart
class GameAreaWidget extends StatelessWidget

class FrameWidget extends StatefulWidget
 │
 │─ List<int> inputNumber = [];
 │─ List<int> correctNumber = [];
 │─ List<int> status = [];
 │─ List<PanelWidget> panelList = [];
 │
 │─ void setNumber(var num) { setState(() { ... }); }
 │─ void checkAnswer() {setState(() { ... });}
 │─ void selectPanel(var j) {setState(() { ... });}
 │─ void resetGame() {setState(() { ... });}
 │
 │─ @override void initState() { resetGame() }
 └─ @override Widget build() { return Stack(...) }

class PanelWidget extends StatelessWidget
 │─ final int inputNumber;
 │─ final int correctNumber;
 └─ final int status;

```

