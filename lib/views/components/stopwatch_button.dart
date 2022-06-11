import 'package:flutter/material.dart';
import 'package:pomodoro/controller/pomodoro.store.dart';
import 'package:provider/provider.dart';

class StopWatchButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;
  const StopWatchButton({
    Key? key,
    required this.text,
    required this.icon,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle: const TextStyle(fontSize: 17)),
      onPressed: click,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 17,
          ),
          Text(text),
        ],
      ),
    );
  }
}
