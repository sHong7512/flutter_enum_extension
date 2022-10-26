import 'package:enum_extension/turn_number.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TurnNumber turnNumber = getRandomTurnNumber();
    return Scaffold(
      appBar: AppBar(title: const Text('Enum Extension')),
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
}
