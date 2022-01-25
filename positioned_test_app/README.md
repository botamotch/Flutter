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
└─class PanelContainerWidget extends StatefulWidget
  │ │─ int selectedPanel = 0;
  │ │─ List<int> inputNumber = [];
  │ │─ List<bool> selectable = [];
  │ │─ List<int> correctNumber = [];
  │ │─ List<PanelContentWidget> panelList = [];
  │ │
  │ │─ void setNumber(var j) { setState(() { ... }); }
  │ │─ void checkAnswer() {setState(() { ... });}
  │ │─ void selectPanel(var i) {setState(() { ... });}
  │ │
  │ │─ @override void initState() { ... }
  │ └─ @override Widget build() { return ... }
  │
  └─class PanelContentWidget extends StatelessWidget
```

