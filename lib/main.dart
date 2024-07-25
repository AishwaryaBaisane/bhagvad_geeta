import 'package:bhagvad_geeta/provider/Geeta_Provider.dart';
import 'package:bhagvad_geeta/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/DeatailPage/Detail_Page_Provider/provider.dart';
import 'Screens/HomePage/Provider/home_page_provider.dart';
import 'Theme_Provider/ThemeProvider.dart';

bool isTrue = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool theme = sharedPreferences.getBool('theme') ?? false;
  isTrue = theme;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeChange(theme),
        ),
        ChangeNotifierProvider(
          create: (context) => GitaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailPageProvider(),
        ),
      ],
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Color(0xffeb6c03),
            onPrimary: Colors.black,
            secondary: Color(0xffde9024),
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Color(0xff0c0c0c),
            onPrimary: Colors.white,
            secondary: Color(0xff1f1f1f),
          ),
        ),
        themeMode: Provider.of<ThemeChange>(context).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: MyRoutes.routes);
  }
}
