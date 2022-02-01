# positioned_test

Positioned Test

数独アプリのプロトタイプ。

ゲーム起動時に数字が入力できなくなる不具合発見。
その後再現できなくなったので放置。なんだろ

### class
- GameAreaWidget
  - ゲーム領域全体を制御するエリア
- FrameWidget
  - 数字、ボタンを設置するエリア。ここだけStatefulWidget
- PanelWidget
  - 数字、ボタンの中身を設定するパネル
- リセット、ヒント等の他のボタンも必要

### variable
- [x] List<int> inputNumber
  - 入力されている数字。ゲーム中にボタンを押すことで変わる
- [x] List<int> correctNumber
  - 正解の数字。ゲーム開始時resetGameによって変わる
- [x] List<int> status
  - 0 : 入力可能、未選択／1 : 入力可能、選択中／2,3 : 入力不可／その他 : Button
- [x] List<PanelWidget> panelList
  - 9x9のマスに入るPanel。PanelWidgetのList

### setState
- [x] setNumber
  - 選択中のパネルに数字を入れる
- [x] selectPanel
  - パネルを選択する
- [ ] resetGame
  - ゲームを初期化する
- [ ] checkAnswer
  - 入力された数字の正解をチェックする
- [x] @override initState
  - resetGameを実行する
- [x] @override build
  - inputPanelの値をpanelListに入力してサイズを決定する

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

![sudoku_mockup](https://github.com/botamotch/Flutter/tree/master/positioned_test_app/doc/sudoku_mockup.png "数独アプリモックアップ")

