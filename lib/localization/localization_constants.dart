import 'package:operation_falafel/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
// import 'package:localization/localization/demo_localization.dart';

String? getTranslated(BuildContext context, String key){
  return DemoLocalization.of(context)?.getTranslatedValue(key);
}

const String ENGLISH = 'en';
const String ARABIC= 'ar';

const String LANGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {

 SharedPreferences _prefs =await SharedPreferences.getInstance();
 print("save into shared ${languageCode}");
 await _prefs.setString(LANGUAGE_CODE, languageCode);
 return _locale(languageCode);
}

Locale _locale (String LanguageCode) {
  Locale _temp;

  switch (LanguageCode){
    case "en":{_temp=Locale(LanguageCode,'US');}break;
    case "ar":{_temp=Locale(LanguageCode,'SA');}break;
    default:_temp=Locale(LanguageCode,'US');

  }

  return _temp;
}


Future<Locale> getLocale() async{
  SharedPreferences _perfs =await SharedPreferences.getInstance();
  String? languageCode = (_perfs.get(LANGUAGE_CODE)??'en') as String?;
  return _locale(languageCode!);
}