import 'package:flutter/material.dart';

import '../../constants.dart';

class MiniWeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Wind", style: TextStyle(fontSize: 18, color: kDarkblue, fontFamily: 'TaiHeritagePro', fontWeight: FontWeight.bold),),
            Text("Humidity", style: TextStyle(fontSize: 18, color: kDarkblue, fontFamily: 'TaiHeritagePro', fontWeight: FontWeight.bold),),

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("12 m/h", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'TaiHeritagePro'),),
            Text("55%", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'TaiHeritagePro'),),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Visibility", style: TextStyle(fontSize: 18, color: kDarkblue, fontFamily: 'TaiHeritagePro', fontWeight: FontWeight.bold),),
            Text("UV", style: TextStyle(fontSize: 18, color: kDarkblue, fontFamily: 'TaiHeritagePro', fontWeight: FontWeight.bold),),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("25 km", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'TaiHeritagePro'),),
            Text("1", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'TaiHeritagePro'),),
          ],
        ),
      ],
    );
  }
}
