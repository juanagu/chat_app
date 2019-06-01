import 'package:firebase_mlkit_language/firebase_mlkit_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageUtils {
  static Future<void> saveLanguage(String language) async {
    var currentLanguage = await getLanguage();
    if (currentLanguage == null ||
        currentLanguage.isEmpty ||
        currentLanguage.compareTo(language) != 0) {
      await FirebaseLanguage.instance.modelManager().downloadModel(language);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', language);
    }
  }

  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language');
  }
}
