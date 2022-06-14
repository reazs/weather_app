import 'package:flutter/material.dart';

import '../../constants.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: (){},
          onHover: (val){

          },
          child: Image.asset("assets/icons/menu-icon.png", height: 36, width: 36,),
        ),
        // Spacer(),
        // Text("Weather Forecast", style: TextStyle(color: kPrimaryColor,
        //     fontSize: 18, fontWeight: FontWeight.normal, fontFamily: "TaiHeritagePro"
        // ),
        // ),
        // Spacer(),


      ],
    );
  }
}
