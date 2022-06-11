import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/controller/pomodoro.store.dart';
import 'package:pomodoro/views/components/stopwatch_button.dart';
import 'package:provider/provider.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (context) {
      return Container(
        color: store.isWorking ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              store.isWorking ? 'Estudar' : 'Descansar',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 120, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!store.started)
                  StopWatchButton(
                    text: 'Iniciar',
                    icon: Icons.play_arrow,
                    click: store.startCounter,
                  ),
                if (store.started)
                  StopWatchButton(
                    text: 'Parar',
                    icon: Icons.stop,
                    click: store.stopCounter,
                  ),
                StopWatchButton(
                  text: 'Reiniciar',
                  icon: Icons.refresh,
                  click: store.refreshCounter,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
