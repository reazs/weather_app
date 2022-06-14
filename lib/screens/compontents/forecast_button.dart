import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/forecastBtnState.dart';

class ForeCastButton extends StatefulWidget {
  @override
  _ForeCastButtonState createState() => _ForeCastButtonState();
}

class _ForeCastButtonState extends State<ForeCastButton> {

  bool is_active = true;
  bool is_clicked = true;
  ForecastBtnState _data = new ForecastBtnState();
  List<String>items = ["Forecast", "This Week"];
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onHover: (val){
            setState(() {

            });
          },
          onTap: (){
            setState(() {
              if (is_active == true){
                is_active = true;

              }else {
                Provider.of<ForecastBtnState>(context, listen: false).buttonInactive();
                is_active = !is_active;
              }
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding/2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: is_active ? kPrimaryColor : Colors.transparent,
                border: Border.all(
                    color: is_active ? kPrimaryColor : Colors.transparent ,
                    width: 3.0
                )
            ),
            child: Text("Forecast", style: TextStyle(fontSize: 18, fontFamily: 'Roboto', color: is_active ?   Colors.white : Colors.black38, fontWeight: FontWeight.normal),),
          ),
        ),

        InkWell(
          onHover: (val){
            setState(() {

            });
          },
          onTap: (){
            setState(() {
              if(is_active==false){
                is_active = false;

              }else{
                is_active = !is_active;
                Provider.of<ForecastBtnState>(context, listen: false).buttonActive();

              }

            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.5),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding/2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:is_active ? Colors.transparent : kPrimaryColor,
                border: Border.all(
                    color:  is_active ? Colors.transparent : kPrimaryColor,
                    width: 3.0
                )
            ),
            child: Text("You Need", style: TextStyle(fontSize: 18, fontFamily: 'Roboto', color: is_active ? Colors.black38 :   Colors.white, fontWeight: FontWeight.normal),),
          ),
        )
      ],
    );
  }
}

