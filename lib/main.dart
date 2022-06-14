import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/forecastBtnState.dart';
import 'package:weather_app/screens/weekly_forecast_screen.dart';

import 'constants.dart';
import 'screens/home_screens.dart';

void main() {
  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_)=>ForecastBtnState()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kDefaultBackgroundColor.withOpacity(0.34),
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
      routes: {
        HomePage.id : (context)=> HomePage(),
        WeeklyForecastScreen.id : (context) => WeeklyForecastScreen(),
        Example.id : (context)=> Example(),
      },
    );
  }
}

