import 'package:hive/hive.dart';

String resolveStartRoute() {
  final box = Hive.box('onboarding');
  final progress = box.get('progress', defaultValue: 'onboarding');

  switch (progress) {
    case 'scenario':
      return '/scenario';
    case 'reflection':
      return '/reflection';
    default:
      return '/';
  }
}
