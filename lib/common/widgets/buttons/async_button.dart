import 'package:flutter/cupertino.dart';
import 'package:assessment/configs/ui_configs.dart';
import 'package:assessment/common/async_bloc/async_status.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../async_bloc/async_state.dart';
import 'base_button.dart';

class AsyncButton extends BaseButton {
  AsyncButton(
      {super.key,
      super.backgroundColor,
      super.padding,
      super.onPressed,
      required AsyncState state,
      required Widget child,
      double? fontSize,
      LoadingIndicator? loadingIndicator})
      : super(child: Builder(builder: (context) {
          if (state.asyncStatus == AsyncStatus.loading) {
            return SizedBox(
              width: FontSizeConfigs.size1,
              height: FontSizeConfigs.size1,
              child:
                  loadingIndicator ?? LoadingIndicatorsConfigs.indicatorLight,
            );
          }
          return child;
        }));
}
