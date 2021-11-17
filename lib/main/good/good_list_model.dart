import 'package:flutter/cupertino.dart';

class GoodListModel extends ChangeNotifier {
  final List<Good> _goodList =
      List.generate(10, (index) => Good(false, 'Good No. $index'));

  get goodList => _goodList;

  get total => _goodList.length;

  collect(int index) {
    var good = _goodList[index];
    _goodList[index] = Good(!good.isCollect, good.goodName);
    notifyListeners();
  }
}

class Good {
  bool isCollect = false;

  String goodName;

  Good(this.isCollect, this.goodName);
}
