import 'package:flutter/material.dart';
import 'package:profanity_filter/profanity_filter.dart';

class Script with ChangeNotifier {
  String? _str;
  bool? _profanity;
  List<String>? _prof;
  String? _censoredText;
  final filter = ProfanityFilter();

  //GETTER
  bool? get profanity => _profanity;
  List<String>? get prof => _prof;
  String? get censoredText => _censoredText;

  //SETTER
  str(st) {
    _str = st;
    checkProf();
  }

  void checkProf() {
    if (_str != null) {
      _profanity = filter.hasProfanity(_str!);
      _prof = filter.getAllProfanity(_str!);
      _censoredText = filter.censorString(_str!);
    }
    notifyListeners();
  }
}
