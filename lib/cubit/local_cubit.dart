import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:localization_bloc/language_cache_helper.dart';
import 'package:meta/meta.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<ChangeLocalState> {
  LocalCubit() : super(ChangeLocalState(local: Locale('en')));

  Future<void> geSavedLanguage () async {
    final String cachedLanguageCode =
    await LanguageCacheHelper().getCachedLanguageCode();

    emit(ChangeLocalState(local: Locale(cachedLanguageCode)));

  }
  Future<void> changeLanguage (String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocalState(local: Locale(languageCode)));
  }

}
