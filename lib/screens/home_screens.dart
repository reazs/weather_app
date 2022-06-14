


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/screens/weekly_forecast_screen.dart';
import '../providers/forecastBtnState.dart';
import 'compontents/forecast_button.dart';
import 'compontents/navbar.dart';


class HomePage extends StatefulWidget{
  static const String id = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);

    _controller.forward();
    _controller.addListener(() {
      setState(() {

      });

    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool  isActive = Provider.of<ForecastBtnState>(context, listen: true).active;

    return Scaffold(

      backgroundColor: kDefaultBackgroundColor.withOpacity(0.34),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(children: [
             NavBar(),

             Text("New York", style: TextStyle(
               fontFamily: 'TaiHeritagePro', fontWeight: FontWeight.bold, fontSize: 24
             ),),
              Text("May 6, 2022", style: TextStyle(color: Colors.black54, fontFamily: 'Roboto'),),
              SizedBox(height: kDefaultPadding,),
              ForeCastButton(),
              SizedBox(height: kDefaultPadding/2,),
              Container(
                height: animation.value*400,
                child: isActive? LottieBuilder.asset("assets/lottiefiles/rain-illustration.json") : LottieBuilder.asset("assets/lottiefiles/rain-icon.json"),
              ),

              SizedBox(height: kDefaultPadding,),
              WeatherInfo(),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, Example.id);
              }, child: Text("Click Me"))



            ],),
          ),
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding*2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Temp", style: kSmallTextStyle,),
                    Text("32°", style: kRegularTextStyle,)
                  ],
                ),
                Column(
                  children: [
                    Text("Wind", style: kSmallTextStyle,),
                    Text("10 km/h", style: kRegularTextStyle,)
                  ],
                ),
                Column(
                  children: [
                    Text("Humidity", style: kSmallTextStyle,),
                    Text("75%", style: kRegularTextStyle,)
                  ],
                )
              ],
            ),

          ),
          SizedBox(height: kDefaultPadding*2,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: kRegularTextStyle.copyWith(fontSize: 20),),
                InkWell(
                  borderRadius: BorderRadius.circular(5),
                    onTap: (){
                        Navigator.pushNamed(context, WeeklyForecastScreen.id);
                    },
                    onHover: (val){

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Next 7 Days", style: kSmallTextStyle.copyWith(color: kPrimaryColor),),
                    )),
                

              ],
            ),
          ),
          
          SizedBox(height: kDefaultPadding,),
          Column(
            children: [
              WeatherInfoCard(
                image: Image.asset("assets/icons/sunny-icon.png", width: 50, height: 50,),
                currentWeather: 12,
                periodOfDay: "Morning",
                high: 88, low: 64,
              ),
              WeatherInfoCard(
                image: Image.asset("assets/icons/cloudy-icon.png", width: 50, height: 50,),
                currentWeather: 16,
                periodOfDay: "Afternoon",
                high: 88, low: 64,
              ),

              WeatherInfoCard(
                image: Image.asset("assets/icons/night-icon.png", width: 50, height: 50,),
                currentWeather: 8,
                periodOfDay: "Night",
                high: 67, low: 54,
              ),


            ],
          ),

        ],
      ),
    );
  }
}



class WeatherInfoCard extends StatelessWidget {
  final int currentWeather;
  final String periodOfDay;
  final int high;
  final int low;
  final Image image;
  WeatherInfoCard({required this.currentWeather, required this.periodOfDay, required this.high, required this.low, required this.image});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding/2, horizontal: kDefaultPadding/2),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2, vertical: kDefaultPadding/2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.black38,

          )

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding/4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),

            ) ,
            child: image,
          ),
          Text("${currentWeather}°", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: "Roboto", color: kPrimaryColor),),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(periodOfDay, style: TextStyle(
                fontSize: 24,
                fontFamily: "TaiHeritagePro",

              )
                ,),
              Text("H:${high}°L:${low}°", style:  TextStyle(
                  height: 0.6,
                  fontSize: 18,
                  color: Colors.black38,
                  fontFamily: 'TaiHeritagePro'
              ),),
            ],
          ),
          SizedBox(
            width: kDefaultPadding,
          )
        ],
      ),
    );
  }
}




class Example extends StatefulWidget {
  static const String id = "Example";
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);

    _controller.forward();
    _controller.addListener(() {
      setState(() {

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    double changeThis = animation.value;
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -100 +  (200*changeThis),
            left: 120*changeThis,
            child: Container(

              margin: EdgeInsets.all(40),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.teal,
              ),
              width: MediaQuery.of(context).size.width*0.8,
            ),
          ),
          Positioned(
              top: 300,
              left:-100 + (changeThis*100),
              child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width*0.4,
            color: Colors.redAccent,
          )),

          Positioned(
              top: 420,
              child: Container(
                height: 100 + 40*changeThis,
                width: 300 + MediaQuery.of(context).size.width*0.8*changeThis -300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,

                ),
              )),
          Positioned(
              bottom: -300 + 340*changeThis,
              child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
          ))

        ],
      ),
    );
  }
}
