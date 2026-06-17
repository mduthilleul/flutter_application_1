import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void reset() {
    counter = 0;
    notifyListeners();
  }
}
