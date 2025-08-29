import 'package:flutter/cupertino.dart';
import 'package:kikitalk/core/app_link/app_widgets.dart';
import 'package:kikitalk/features/cumulativepoint/presentation/widgets/cumulativepoint_widget.dart';

class CumulativePointWidget extends ICumulativePointWidget {
  @override
  Widget info() {
    return const WIDCumulativePoint();
  }
}