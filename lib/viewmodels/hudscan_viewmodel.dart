import 'package:flutter/foundation.dart';

enum HudscanStep { home, scanning, resultat, rekommendationer }

class HudscanViewModel extends ChangeNotifier {
  HudscanStep _step = HudscanStep.home;
  String? _selectedProductId;

  HudscanStep get step => _step;
  String? get selectedProductId => _selectedProductId;

  void startScan() {
    _step = HudscanStep.scanning;
    notifyListeners();
  }

  void completeScan() {
    _step = HudscanStep.resultat;
    notifyListeners();
  }

  void showResultat() {
    _step = HudscanStep.resultat;
    notifyListeners();
  }

  void showRecommendations() {
    _step = HudscanStep.rekommendationer;
    notifyListeners();
  }

  void selectProduct(String id) {
    _selectedProductId = id;
    notifyListeners();
  }

  void reset() {
    _step = HudscanStep.home;
    _selectedProductId = null;
    notifyListeners();
  }

  void back() {
    switch (_step) {
      case HudscanStep.scanning:
        _step = HudscanStep.home;
      case HudscanStep.resultat:
        _step = HudscanStep.home;
      case HudscanStep.rekommendationer:
        _step = HudscanStep.resultat;
      case HudscanStep.home:
        break;
    }
    notifyListeners();
  }
}
