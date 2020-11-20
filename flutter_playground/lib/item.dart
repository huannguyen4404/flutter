class Item {
  String content;
  double money;

  Item({this.content, this.money});

  @override
  String toString() {
    return 'content: $content - money: $money';
  }
}
