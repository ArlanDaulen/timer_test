import 'package:flutter/material.dart';
import 'package:timer/base/base_provider.dart';
import 'package:timer/pages/advanced_task/provider/advanced_task_provider.dart';
import 'package:timer/shared/size_config.dart';
import 'package:timer/shared/theme.dart';

class AdvancedTaskScreen extends StatelessWidget {
  const AdvancedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<AdvancedTaskProvider>(
        onReady: (_) => _.init(context),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AdvancedAppColors.primaryColor,
              body: model.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30),
                            vertical: getProportionateScreenHeight(50)),
                        width: model.size!.width,
                        child: TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                          cursorColor: Colors.grey,
                          controller: model.textController,
                          maxLines: null,
                        ),
                      ),
                    ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.deepPurpleAccent,
                onPressed: () {},
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ));
        },
        model: AdvancedTaskProvider());
  }
}
