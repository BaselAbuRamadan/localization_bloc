import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Apploclizations{
  final Locale? locale;

  Apploclizations({
    this.locale
  });
  static Apploclizations? of(BuildContext context){
    return Localizations.of<Apploclizations>(context,Apploclizations);

  }
  static const LocalizationsDelegate<Apploclizations> delegate =
  _AppLocalizationsDelegate();

  late Map<String,String> _localizedStrings;

  Future loadJsonLanguage() async {
    String jsonString = await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
    Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }
  String translate(String key)=> _localizedStrings[key] ?? "";

}
class _AppLocalizationsDelegate extends LocalizationsDelegate<Apploclizations>{
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<Apploclizations> load(Locale locale) async {
   Apploclizations localizations = Apploclizations(locale: locale);
   await localizations.loadJsonLanguage();
   return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Apploclizations> old) => false;


}

extension Translatex on String{
  String tr(BuildContext context){
    return Apploclizations.of(context)!.translate(this);
  }
}


