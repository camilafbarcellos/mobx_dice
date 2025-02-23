import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'dice_counter.dart';

class DiceExample extends StatelessWidget {
  const DiceExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider<DiceCounter>(
        create: (_) => DiceCounter(),
        child: Scaffold(
          backgroundColor: Colors.amber,
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text(
              'Tap the dice !!!'.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Hind'),
            ),
          ),
          body: const SafeArea(
            child: DiceView(),
          ),
        ),
      );
}

class DiceView extends StatelessWidget {
  const DiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diceCounter = Provider.of<DiceCounter>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: diceCounter.roll,
                    child: Observer(
                      builder: (_) =>
                          Image.asset('assets/images/dice${diceCounter.left}.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: diceCounter.roll,
                    child: Observer(
                      builder: (_) =>
                          Image.asset('assets/images/dice${diceCounter.right}.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Observer(
              builder: (_) => Text(
                'Total ${diceCounter.total}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16,
                    fontFamily: 'Verdana'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
