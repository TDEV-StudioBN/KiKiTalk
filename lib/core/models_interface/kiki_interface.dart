
import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class IKiKi extends AppInterFace {
  final String style;
  final String name;
  final String description;

  IKiKi({
    required this.style,
    required this.name,
    required this.description,
    super.version
  });
}