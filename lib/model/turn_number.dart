import 'package:flutter/foundation.dart';

enum TurnNumber {
  First,
  Second,
  Third,
  Fourth,
}

extension TurnNumberExtension on TurnNumber {
  String get name => describeEnum(this); //Get Name :: SelectedColor

  String get nameWithoutDescribe => this.toString();

  String get displayColorChangeText {
    switch (this) {
      case TurnNumber.First:
        return 'Change to First';
      case TurnNumber.Second:
        return 'Change to Second';
      case TurnNumber.Third:
        return 'Change to Third';
      case TurnNumber.Fourth:
        return 'Change to Fourth';
    }
  }
}