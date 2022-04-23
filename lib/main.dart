import 'package:elmenues/populator.dart';
import 'package:elmenues/view/home/filter_screen.dart';
import 'package:elmenues/view/home/home_screen.dart';
import 'package:elmenues/view/home/search_screen.dart';
import 'package:elmenues/view/home_navigate.dart';
import 'package:flutter/material.dart';

import 'core/db/data/restaurant.dart';
import 'core/di/configuartion.dart';
import 'view/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Populator populator=getIt<Populator>();
  populator.populateData();
  runApp(const MyApp());
}

//to add appTheme
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  LoginStart(),
    );
  }
}


