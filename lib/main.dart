import 'package:firebase1/screens/Address/AddressScreen.dart';
import 'package:firebase1/screens/Authentication/AuthScreen.dart';
import 'package:firebase1/screens/ContactScreen/controller.dart';
import 'package:firebase1/screens/Details/Detailsscreen.dart';
import 'package:firebase1/screens/TaskImageScreen/ImageSreen.dart';
import 'package:firebase1/screens/splash/splash.dart';
import 'package:firebase1/translation/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'helper/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //added obligatory
  await Firebase.initializeApp(); //added because of flutter core package
  await  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Controller con=Get.put(Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      translations:Translation() ,
      locale:Locale(con.selectedLanguage.value),
      fallbackLocale:Locale('en'),// error

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:',),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
