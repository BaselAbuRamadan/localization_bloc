
import 'package:flutter/material.dart';
import 'package:localization_bloc/app_localization.dart';
import 'package:localization_bloc/settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home".tr(context)),
        actions: [
          IconButton(onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(
              builder: (ctx) => const SettingsPage()) ),
              icon: const Icon(Icons.settings))
        ],

      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ("hello_msg").tr(context),

            style: TextStyle(fontSize:25),
                  textAlign: TextAlign.center,
              ),
              Text("This text will not be translated",
              style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
