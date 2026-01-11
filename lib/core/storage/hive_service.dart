import 'package:hive/hive.dart';

class HiveService {
  static const String onboardingBoxName = 'onboarding';

  static Future<Box> openOnboardingBox() async {
    return await Hive.openBox(onboardingBoxName);
  }

  static Future<void> saveLifeSituation(String value) async {
    final box = await Hive.openBox(onboardingBoxName);
    await box.put('lifeSituation', value);
  }

  static Future<void> saveIntention(String value) async {
    final box = await Hive.openBox(onboardingBoxName);
    await box.put('intention', value);
  }

  static String? getLifeSituation() {
    final box = Hive.box(onboardingBoxName);
    return box.get('lifeSituation');
  }

  static String? getIntention() {
    final box = Hive.box(onboardingBoxName);
    return box.get('intention');
  }

  static Future<void> clearOnboarding() async {
    final box = Hive.box(onboardingBoxName);
    await box.clear();
  }

  static Future<void> saveProgress(String progress) async {
    final box = Hive.box(onboardingBoxName);
    await box.put('progress', progress);
  }

  static String getProgress() {
    final box = Hive.box(onboardingBoxName);
    return box.get('progress', defaultValue: 'onboarding');
  }

}
