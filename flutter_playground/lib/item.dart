class Item {
  String content;
  double money;
  DateTime createdAt;

  Item({this.content, this.money, this.createdAt});

  @override
  String toString() {
    return 'content: $content - money: $money';
  }
}
