import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/controller/pomodoro.store.dart';
import 'package:pomodoro/views/components/stopwatch.dart';
import 'package:pomodoro/views/components/time_enter.dart';
import 'package:provider/provider.dart';

class PomodoroView extends StatelessWidget {
  const PomodoroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: StopWatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeEnter(
                    value: store.workTime,
                    title: 'Trabalho',
                    inc: store.increaseWorkTime,
                    dec: store.decreaseWorkTime,
                  ),
                  TimeEnter(
                    value: store.restTime,
                    title: 'Descanso',
                    inc: store.increaseRestTime,
                    dec: store.decreaseRestTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
