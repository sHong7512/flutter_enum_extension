import 'dart:math';

import 'package:enum_extension/model/turn_number.dart';
import 'package:flutter/material.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  @override
  Widget build(BuildContext context) {
    TurnNumber turnNumber = getRandomTurnNumber();
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${TurnNumber.values}', textAlign: TextAlign.center),
            Text('TurnNumber len :: ${TurnNumber.values.length}', textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(turnNumber.name),
            Text(turnNumber.nameWithoutDescribe),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  turnNumber = getRandomTurnNumber();
                });
              },
              child: Text(turnNumber.displayColorChangeText),
            )
          ],
        ),
      ),
    );
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
}
