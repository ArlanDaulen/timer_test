import 'package:flutter/material.dart';

import 'package:timer/pages/provider/main_page_provider.dart';
import 'package:timer/shared/size_config.dart';

class ThirtySecondEclipse extends StatefulWidget {
  const ThirtySecondEclipse({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);
  final MainPageProvider model;
  final int index;

  @override
  State<ThirtySecondEclipse> createState() => _ThirtySecondEclipseState();
}

class _ThirtySecondEclipseState extends State<ThirtySecondEclipse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: const Duration(seconds: 30),
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenHeight(40),
      padding: const EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.model.animations![widget.index].value!,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              widget.model.timedUpThirtySecondEclipses[widget.index]
                  ? Colors.white
                  : Color(0xffF9DC78),
              widget.model.timedUpThirtySecondEclipses[widget.index]
                  ? Colors.black
                  : Color(0xffFF4E50),
            ]),
        borderRadius: BorderRadius.circular(188),
      ),
      child: Container(
        // duration: const Duration(seconds: 30),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(8),
          horizontal: getProportionateScreenWidth(8),
        ),
        decoration: BoxDecoration(
          color: widget.model.animations![widget.index].value!,
          // color: widget.model.timedUpThirtySecondEclipses[widget.index]
          //     ? Colors.grey
          //     : Color(0xff6CD09C),
          borderRadius: BorderRadius.circular(188),
        ),
        child: Text('30',
            style: TextStyle(
              color: widget.model.timedUpThirtySecondEclipses[widget.index]
                  ? const Color(0xffC4C4C4)
                  : Colors.white,
              fontSize: getProportionateScreenWidth(12),
            )),
        // child: AnimatedDefaultTextStyle(
        //   child: const Text('30'),
        //   style: TextStyle(
        //     color: model.timedUpThirtySecondEclipses[index] ? const Color(0xffC4C4C4) : Colors.white,
        //     fontSize: getProportionateScreenWidth(12),
        //   ),
        //   duration: const Duration(seconds: 30),
        // ),
      ),
    );
  }
}
