import 'package:flutter/material.dart';

class GenreProvider extends ChangeNotifier {
  List<int> _selectedIndices = [];

  List<int> get selectedIndices => _selectedIndices;

  void toggleIndex(int index) {
    if (_selectedIndices.contains(index)) {
      _selectedIndices.remove(index);
    } else {
      if (_selectedIndices.length < 5) {
        _selectedIndices.add(index);
      }
    }

    notifyListeners();
  }

  void clearSelection() {
    _selectedIndices.clear();
    notifyListeners();
  }
}
