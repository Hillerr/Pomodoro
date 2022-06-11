import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/controller/pomodoro.store.dart';
import 'package:pomodoro/views/pomodoro_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (context) => PomodoroStore(),
        )
      ],
      child: MaterialApp(
        title: 'Pomodoro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PomodoroView(),
      ),
    );
  }
}
