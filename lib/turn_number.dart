import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

TurnNumber getRandomTurnNumber() {
  Random rand = Random();
  int num = rand.nextInt(TurnNumber.values.length);
  switch (num) {
    case 0:
      return TurnNumber.First;
    case 1:
      return TurnNumber.Second;
    case 2:
      return TurnNumber.Third;
    case 3:
      return TurnNumber.Fourth;
    default:
      throw Exception('$num is not switching parameter');
  }
}
