import 'package:flutter/material.dart';

import 'package:timer/pages/provider/main_page_provider.dart';
import 'package:timer/pages/ui/widgets/thirty_second_eclipse.dart';
import 'package:timer/shared/size_config.dart';

class ThirtySecondEclipsesCount extends StatelessWidget {
  const ThirtySecondEclipsesCount({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MainPageProvider model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(40),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: model.thirtySecondsCount,
        separatorBuilder: (_, index) => Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(2),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(2),
                height: 1,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemBuilder: (_, index) => ThirtySecondEclipse(
          model: model,
          index: index,
        ),
      ),
    );
  }
}
