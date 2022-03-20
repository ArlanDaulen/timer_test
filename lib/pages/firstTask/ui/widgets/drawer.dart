import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer/shared/size_config.dart';
import 'package:timer/shared/theme.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<String> menuSvgImages = [
    AppSvgImages.homeIcon,
    AppSvgImages.successesIcon,
    AppSvgImages.settingsIcon,
    AppSvgImages.reviewIcon,
    AppSvgImages.promptIcon,
    AppSvgImages.shareIcon,
  ];

  List<String> menuItemsTexts = [
    'Home',
    'Successes',
    'Settings',
    'Review',
    'Prompt',
    'Share this',
  ];

  List<bool> menuItemSelected = List.generate(6, (index) => false);

  @override
  void initState() {
    super.initState();
    menuItemSelected.first = true;
  }

  setSelectedMenuItem(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < menuItemSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          menuItemSelected[buttonIndex] = true;
        } else {
          menuItemSelected[buttonIndex] = false;
        }
      }
    });
    if (menuItemSelected.first) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(211),
      color: AppColors.primaryColor,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              AppSvgImages.back_in_drawer_1_Icon,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              AppSvgImages.back_in_drawer_2_Icon,
            ),
          ),
          Positioned(
            // left: getProportionateScreenWidth(24),
            top: getProportionateScreenHeight(78),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(24),
                  ),
                  child: Text(
                    'Instruments'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(380),
                  width: getProportionateScreenWidth(211),
                  child: ListView.separated(
                    // shrinkWrap: true,
                    itemCount: 6,
                    separatorBuilder: (_, index) => Container(
                      height: getProportionateScreenHeight(23),
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => setSelectedMenuItem(index),
                      child: Container(
                        margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(9),
                          horizontal: getProportionateScreenWidth(24),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          color: menuItemSelected[index]
                              ? const Color(0xffFFFFFF).withOpacity(0.7)
                              : Colors.white.withOpacity(0),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(menuSvgImages[index]),
                            SizedBox(
                              width: getProportionateScreenWidth(20),
                            ),
                            Text(
                              menuItemsTexts[index].toUpperCase(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
