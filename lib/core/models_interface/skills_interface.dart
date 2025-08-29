import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class ISkills extends AppInterFace {
  final String id;
  final String userEmail;
  final double reading;
  final double listening;
  final double writing;
  final double speaking;

  ISkills({
    required this.id,
    required this.userEmail,
    required this.reading,
    required this.listening,
    required this.writing,
    required this.speaking,
    super.version
  });
}
