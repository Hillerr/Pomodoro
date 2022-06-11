import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType { work, rest }

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;

  @observable
  int workTime = 30;

  @observable
  int restTime = 10;

  @observable
  int minutes = 30;

  @observable
  int seconds = 0;

  @observable
  IntervalType intervalType = IntervalType.work;

  Timer? stopWatch;

  @action
  void startCounter() {
    started = true;
    stopWatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _toggleIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stopCounter() {
    started = false;
    stopWatch?.cancel();
  }

  @action
  void refreshCounter() {
    stopCounter();
    intervalType = IntervalType.work;
    minutes = isWorking ? workTime : restTime;
    seconds = 0;
  }

  @action
  void increaseWorkTime() {
    workTime = workTime + 5;
    if (isWorking) {
      refreshCounter();
    }
  }

  @action
  void decreaseWorkTime() {
    if (workTime > 0) {
      workTime = workTime - 5;
    }
    if (isWorking) {
      refreshCounter();
    }
  }

  @action
  void increaseRestTime() {
    restTime = restTime + 5;
    if (isResting) {
      refreshCounter();
    }
  }

  @action
  void decreaseRestTime() {
    if (restTime > 0) {
      restTime = restTime - 5;
    }

    if (isResting) {
      refreshCounter();
    }
  }

  bool get isWorking => intervalType == IntervalType.work;
  bool get isResting => intervalType == IntervalType.rest;

  @action
  void _toggleIntervalType() {
    if (isWorking) {
      intervalType = IntervalType.rest;
      minutes = restTime;
    } else {
      intervalType = IntervalType.work;
      minutes = workTime;
    }
    seconds = 0;
  }
}
