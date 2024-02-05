import 'package:flutter/widgets.dart';
import 'package:assessment/configs/ui_configs.dart';
import 'package:assessment/common/async_bloc/base_state.dart';
import 'package:assessment/common/widgets/containers/full_container.dart';
import 'package:assessment/common/widgets/containers/percentage_container.dart';
import 'package:assessment/common/widgets/text/body.dart';
import 'package:assessment/common/widgets/text/headers.dart';

class ErrorScreen extends StatelessWidget {
  final BaseState state;

  const ErrorScreen(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return FullContainer(
        decoration: const BoxDecoration(color: ColorsConfigs.dark),
        child: PercentageContainer(
            width: 0.75,
            child: Column(
              children: [
                Image.asset("assets/images/error.png"),
                const SizedBox(height: SpacingConfigs.spacing5,),
                Heading2("Sorry, An Error has Occurred", textAlign: TextAlign.center,),
                const SizedBox(height: SpacingConfigs.spacing3,),
                BodyText(state.initError!.message, textAlign: TextAlign.center),
                const SizedBox(
                  height: SpacingConfigs.spacing2,
                ),
              ],
            )));
  }
}
