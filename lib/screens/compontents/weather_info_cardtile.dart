import 'package:flutter/material.dart';

import '../../constants.dart';
import 'mini_weather_info.dart';
class WeatherInfoCardTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(kDefaultPadding*3/2),
      width: MediaQuery.of(context).size.width*0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],

      ),

      child: Column(
        children: [
          Row(
            children: [
              Text("Monday", style: kRegularTextStyle.copyWith(fontWeight: FontWeight.bold, fontFamily: "Roboto", color: kDarkblue),),
              SizedBox(width: kDefaultPadding,),
              Image.asset("assets/icons/sunny-icon.png", width: 30, height: 30,),
              Spacer(),
              Text("26°C", style: kBigHeading.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(width: kDefaultPadding/2,),
              Text("19°C", style: kBigHeading.copyWith(color: Colors.black26, fontSize: 24),)
            ],
          ),

          MiniWeatherInfo(),
        ],
      ),
    );
  }
}