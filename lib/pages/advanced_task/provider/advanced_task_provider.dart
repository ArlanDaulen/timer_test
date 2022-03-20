import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:timer/base/base_bloc.dart';
import 'package:timer/shared/size_config.dart';

class AdvancedTaskProvider extends BaseBloc {
  Size? size;

  var textController;
  init(BuildContext context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }
}
