import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/app_localization.dart';

import 'cubit/local_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr(context)),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<LocalCubit, ChangeLocalState>(
              listener: (context, state) {
                Navigator.of(context).pop();
              },
              builder: (context, state) {
                return DropdownButton<String>(
                  value: state.local.languageCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<LocalCubit>().changeLanguage(newValue);
                    }
                  },
                );
              },
            )),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:localization_bloc/cubit/local_cubit.dart';
// import 'app_localization.dart';
//
// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);
//
//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("settings".tr(context)),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: BlocBuilder<LocalCubit, LocalState>(
//             builder: (context, state) {
//               if(state is ChangeLocalState){
//                 return DropdownButton<String>(
//                   value: state.local.languageCode,
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                   items: ['ar', 'en'].map((String items) {
//                     return DropdownMenuItem<String>(
//                         value: items,
//                         child: Text(items)
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     if(newValue != null){
//                       BlocProvider.of<LocalCubit>(context).changeLanguage(newValue);
//                       // context.read<LocalCubit>()
//                       //     .changeLanguage(newValue);
//
//                     }
//                   },
//                 );
//
//               }
//               return SizedBox();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
