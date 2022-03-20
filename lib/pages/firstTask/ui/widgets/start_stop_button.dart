import 'package:flutter/material.dart';
import 'package:timer/pages/firstTask/provider/main_page_provider.dart';
import 'package:timer/shared/size_config.dart';
import 'package:timer/shared/theme.dart';

class StartStopButton extends StatelessWidget {
  StartStopButton({required this.model});
  final MainPageProvider model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => model.setTimerStartStop(),
      child: Container(
        width: getProportionateScreenWidth(180),
        height: getProportionateScreenHeight(50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.yellowColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          model.isTimeUp
              ? 'TIME IS UP'
              : model.isTimerStart
                  ? 'STOP'
                  : 'FOCUS',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
          ),
        ),
      ),
    );
  }
}
