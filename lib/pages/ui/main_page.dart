import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer/base/base_provider.dart';
import 'package:timer/pages/provider/main_page_provider.dart';
import 'package:timer/pages/ui/widgets/drawer.dart';
import 'package:timer/pages/ui/widgets/start_stop_button.dart';
import 'package:timer/pages/ui/widgets/thirty_second_eclipses_count.dart';
import 'package:timer/pages/ui/widgets/timer_slider.dart';
import 'package:timer/shared/size_config.dart';
import 'package:timer/shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff76D89B),
            Color(0xff57BF9B),
          ],
        ),
      ),
      child: BaseProvider<MainPageProvider>(
        model: MainPageProvider(),
        onReady: (p0) => p0.init(context, this),
        onDispose: (p0) => p0.dispose(),
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              key: model.globalKey,
              backgroundColor: Colors.transparent,
              drawer: CustomDrawer(),
              body: Stack(
                children: [
                  Positioned(
                    top: getProportionateScreenHeight(148),
                    child: Image.asset(
                      AppPngImages.home_ic,
                      width: getProportionateScreenWidth(374),
                      height: getProportionateScreenHeight(355),
                    ),
                  ),
                  Positioned(
                    right: getProportionateScreenWidth(15),
                    top: getProportionateScreenHeight(250),
                    child: TimerSlider(
                      model: model,
                    ),
                  ),
                  Positioned(
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10),
                    bottom: getProportionateScreenHeight(250),
                    child: Center(
                      child: ThirtySecondEclipsesCount(model: model),
                    ),
                  ),
                  Positioned(
                    bottom: getProportionateScreenHeight(130),
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10),
                    child: Center(
                      child: Text(
                        model.duration!.inSeconds.toString(),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(60),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10),
                    bottom: getProportionateScreenHeight(50),
                    child: Center(
                      child: StartStopButton(model: model,),
                    ),
                  ),
                  Positioned(
                    left: getProportionateScreenWidth(10),
                    bottom: getProportionateScreenHeight(65),
                    child: SvgPicture.asset(AppSvgImages.menu_ic),
                  ),
                  Positioned(
                    left: 0,
                    bottom: getProportionateScreenHeight(35),
                    child: GestureDetector(
                        onTap: () => model.globalKey.currentState!.openDrawer(),
                        child: SvgPicture.asset(AppSvgImages.drawer_ic)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}