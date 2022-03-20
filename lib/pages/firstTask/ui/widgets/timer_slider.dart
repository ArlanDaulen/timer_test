import 'package:flutter/material.dart';
import 'package:timer/pages/firstTask/provider/main_page_provider.dart';

import 'package:timer/shared/size_config.dart';
import 'package:timer/shared/theme.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MainPageProvider model;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: getProportionateScreenWidth(5),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 12,
          ),
        ),
        child: Slider(
          min: 0,
          max: 180,
          divisions: 6,
          thumbColor: AppColors.yellowColor,
          activeColor: AppColors.yellowColor,
          inactiveColor: const Color(0xffFFFFFF),
          value: model.sliderValue,
          onChanged: (double value) =>
              model.setSliderValueAndEclipseCount(value),
        ),
      ),
    );
  }
}
