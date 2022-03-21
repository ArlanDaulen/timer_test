import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timer/base/base_bloc.dart';
import 'package:timer/shared/size_config.dart';

class MainPageProvider extends BaseBloc {
  double sliderValue = 0.0;
  bool isTimerStart = false;
  bool isTimeUp = false;
  int thirtySecondsCount = 0;
  Timer? mainTimer;
  Duration? duration;
  List<bool> timedUpThirtySecondEclipses = [];
  double progressPercent = 0;

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  List<AnimationController>? controllers = [];
  List<Animation<Color?>>? animations = [];
  List<bool> controllersForwarded = List.generate(6, (index) => false);

  init(BuildContext context, TickerProviderStateMixin vsync) async {
    setLoading(true);
    SizeConfig().init(context);
    controllers = List.generate(
      6,
      (index) => AnimationController(
          duration: const Duration(seconds: 30), vsync: vsync),
    );

    animations = List.generate(
        6,
        (index) => ColorTween(begin: Colors.green, end: Colors.white)
            .animate(controllers![index])
          ..addStatusListener((status) {
            log('Animation: $index  Status: $status');
          }));

    duration = const Duration(seconds: 0);
    setLoading(false);
    notifyListeners();
  }

  setSliderValueAndEclipseCount(double value) {
    for (int i = 0; i < controllers!.length; i++) {
      controllers![i].reset();
      notifyListeners();
    }
    sliderValue = value;
    duration = Duration(seconds: sliderValue.toInt());
    setEclipseCount(value);
    notifyListeners();
  }

  setEclipseCount(double value) {
    isTimeUp = false;
    isTimerStart = false;
    try {
      mainTimer!.cancel();
    } catch (e) {
      log("$e");
    }

    thirtySecondsCount = sliderValue ~/ 30;
    timedUpThirtySecondEclipses =
        List.generate(thirtySecondsCount, (index) => false);
    notifyListeners();
  }

  startStopTimer() {
    if (isTimerStart) {
      const oneSecond = Duration(seconds: 1);
      log(oneSecond.inMilliseconds.toString());
      mainTimer = Timer.periodic(oneSecond, (timer) {
        double temp = duration!.inSeconds / 30;
        if (temp == 6.0) {
          controllers![5].forward();
          controllersForwarded[5] = true;
        }
        if (temp == 5.0) {
          controllers![4].forward();
          controllersForwarded[4] = true;
        }
        if (temp == 4.0) {
          controllers![3].forward();
          controllersForwarded[3] = true;
        }
        if (temp == 3.0) {
          controllers![2].forward();
          controllersForwarded[2] = true;
        }
        if (temp == 2.0) {
          controllers![1].forward();
          controllersForwarded[1] = true;
        }
        if (temp == 1.0) {
          controllers![0].forward();
          controllersForwarded[0] = true;
        }

        if (duration!.inSeconds == 0) {
          timer.cancel();
          isTimeUp = true;
          // timeUp();

          notifyListeners();
        } else {
          duration =
              Duration(seconds: duration!.inSeconds - oneSecond.inSeconds);
          progressPercent = (1 - (duration!.inSeconds / sliderValue.toInt()));
          // log(((1 - (duration!.inSeconds / sliderValue.toInt())) ).toString());
          notifyListeners();
        }
      });
    } else {
      mainTimer!.cancel();
    }
  }

  setTimerStartStop() {
    if (isTimerStart) {
      isTimerStart = false;
      for (int i = 0; i < controllers!.length; i++) {
        controllers![i].stop();
        controllersForwarded[i] = false;
        notifyListeners();
      }
    } else {
      isTimerStart = true;
      for (int i = 0; i < controllersForwarded.length; i++) {
        if (controllersForwarded[i]) controllers![i].forward();
        notifyListeners();
      }
    }
    notifyListeners();
    startStopTimer();
  }

  dispose() {
    for (var element in controllers!) {
      element.dispose();
    }
    notifyListeners();
  }
}
