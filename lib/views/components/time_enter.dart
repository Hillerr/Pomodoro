import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/controller/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimeEnter extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? inc;
  final void Function()? dec;

  const TimeEnter({
    Key? key,
    required this.value,
    required this.title,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dec,
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: store.isWorking ? Colors.red : Colors.green,
                ),
              ),
              Text(
                ' $value min ',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              ElevatedButton(
                onPressed: inc,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(9),
                  primary: store.isWorking ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
