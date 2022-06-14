import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/screens/home_screens.dart';

import 'compontents/mini_weather_info.dart';
import 'compontents/navbar.dart';
import 'compontents/weather_info_cardtile.dart';

class WeeklyForecastScreen extends StatelessWidget {
  static const String id = "WeeklyForecastScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),

            child: Column(

              children: [
                NavBar(),
                SizedBox(height: kDefaultPadding,),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(

                    onTap: (){

                      Navigator.popAndPushNamed(context, HomePage.id);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.topLeft,
                  child: RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Next ",),
                      TextSpan(text: "7 days", style: TextStyle(fontWeight: FontWeight.bold))
                    ]
                  ,style: kBigHeading),

                  ),
                ),

                SizedBox(height: kDefaultPadding,),
                WeatherInfoCardTile(),
              SizedBox(height: kDefaultPadding*3/2,),
                DailyWeatherInfoCard(
                  day: "TUE",
                  lottieIconPath: "rain-icon.json",
                  low: 20,
                  high: 24,
                  chance: 54,
                  iconPath: "cloudy-icon.png",
                ),
                DailyWeatherInfoCard(
                  day: "WED",
                  lottieIconPath: "snow-sunny-icon.json",
                  low: 20,
                  high: 24,
                  chance: 54,
                  iconPath: "sun-icon.png"
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}



class DailyWeatherInfoCard extends StatelessWidget {
  final String day, lottieIconPath, iconPath;
  final int low, high, chance;
  DailyWeatherInfoCard({required this.day, required this.chance, required this.lottieIconPath, required this.low, required this.high, required this.iconPath});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 2.0,
                  color: kDarkblue
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(day.toUpperCase(),
                style: TextStyle(
                  fontSize: 16, fontFamily: "Roboto", color: kDarkblue,
                ),),
              Row(
                children: [
                  Image.asset("assets/icons/${iconPath}", width: 25, height: 25,),
                  Text("${chance}%",style: TextStyle(
                      color: Colors.grey
                  ),)
                ],
              ),

            ],
          ),

          LottieBuilder.asset("assets/lottiefiles/${lottieIconPath}", height: 60,),
          Text("Low:", style: TextStyle(fontSize: 12, color: Colors.grey),),
          Text("${low}°C", style: kBigHeading.copyWith(fontSize: 22),),
          Text("High:", style: TextStyle(fontSize: 12, color: Colors.grey)),
          Text("${high}°C", style: kBigHeading.copyWith(fontSize: 22),),
        ],
      ),
    );
  }
}



