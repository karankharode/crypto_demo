// ignore_for_file: library_prefixes

import 'dart:io';

import 'package:crypto_demo/modules/home_screen/controller/CoinController.dart';
import 'package:crypto_demo/modules/home_screen/models/HiveCoinModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:provider/provider.dart';
import 'modules/home_screen/views/home_screen.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveCoinMODELAdapter());
  await Hive.openBox<HiveCoinMODEL>("coins");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CoinController()),
        ],
        child: MaterialApp(
          title: 'Crypto Listing Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: kPrimaryTextColor,
                  fontFamily: 'Onest',
                ),
            iconTheme: const IconThemeData(color: kPrimaryTextColor),
          ),
          home: const HomeScreen(),
        ));
  }
}
