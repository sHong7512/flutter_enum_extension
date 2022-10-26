import 'dart:math';

import 'package:enum_extension/model/turn_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTurnNum extends StateNotifier<TurnNumber> {
  MyTurnNum() : super(TurnNumber.First);

  Random random = Random();

  rand() {
    int num = random.nextInt(TurnNumber.values.length);
    switch (num) {
      case 0:
        state = TurnNumber.First;
        break;
      case 1:
        state = TurnNumber.Second;
        break;
      case 2:
        state = TurnNumber.Third;
        break;
      case 3:
        state = TurnNumber.Fourth;
        break;
      default:
        throw Exception('$num is not switching parameter');
    }
  }
}

final myTurnNumProvider = StateNotifierProvider<MyTurnNum, TurnNumber>((ref) => MyTurnNum());

class RiverPodScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TurnNumber turnNumState = ref.watch(myTurnNumProvider);
    final turnNumRead = ref.read(myTurnNumProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${TurnNumber.values}', textAlign: TextAlign.center),
            Text('TurnNumber len :: ${TurnNumber.values.length}', textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(turnNumState.name),
            Text(turnNumState.nameWithoutDescribe),
            ElevatedButton(
              onPressed: () {
                turnNumRead.rand();
              },
              child: Text(turnNumState.displayColorChangeText),
            )
          ],
        ),
      ),
    );
  }
}
