import 'package:bhagvad_geeta/provider/Geeta_Provider.dart';
import 'package:bhagvad_geeta/routes/routes.dart';
import 'package:bhagvad_geeta/utils/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Orange,
            onPrimary: Colors.black,
            secondary: LightOrange,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: DarkBlack,
            onPrimary: Colors.white,
            secondary: LightBlack,
          ),
        ),
        themeMode: Provider.of<ThemeChange>(context).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: MyRoutes.routes);
  }
}
