import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_bloc/cubit/local_cubit.dart';

import 'app_localization.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[ BlocProvider(
          create: (context) => LocalCubit()..geSavedLanguage(),
        )
        ],

        child: BlocBuilder<LocalCubit, ChangeLocalState>(
          builder: (context, state) {
            if(state is ChangeLocalState){
              return MaterialApp(
                locale: state.local,

                supportedLocales: const [
                  //iso code from web
                  Locale('en'),
                  Locale('ar')
                ],
                localizationsDelegates: const [
                  Apploclizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }

                  return supportedLocales.first;
                },


                home: MyHomePage(),
              );
            }
              return SizedBox();


          },
        ),

    );

  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'app_localization.dart';
// import 'cubit/local_cubit.dart';
// import 'home_page.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => LocalCubit()..geSavedLanguage(),
//         ),
//       ],
//       child: BlocBuilder<LocalCubit, ChangeLocalState>(
//         builder: (context, state) {
//           return MaterialApp(
//             locale: state.local,
//             supportedLocales: const [Locale('en'), Locale('ar')],
//             localizationsDelegates: const [
//               Apploclizations.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate
//             ],
//             localeResolutionCallback: (deviceLocale, supportedLocales) {
//               for (var locale in supportedLocales) {
//                 if (deviceLocale != null &&
//                     deviceLocale.languageCode == locale.languageCode) {
//                   return deviceLocale;
//                 }
//               }
//
//               return supportedLocales.first;
//             },
//             debugShowCheckedModeBanner: false,
//             home: const MyHomePage(),
//           );
//         },
//       ),
//     );
//   }
// }