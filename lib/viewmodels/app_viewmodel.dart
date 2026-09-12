import 'package:flutter/foundation.dart';

enum AppTab { hem, hudscan, forDig, mina }

class AppViewModel extends ChangeNotifier {
  AppTab _tab = AppTab.hem;
  bool _showSplash = true;

  AppTab get tab => _tab;
  bool get showSplash => _showSplash;

  void selectTab(AppTab value) {
    if (_tab == value) return;
    _tab = value;
    notifyListeners();
  }

  void finishSplash() {
    if (!_showSplash) return;
    _showSplash = false;
    notifyListeners();
  }
}
