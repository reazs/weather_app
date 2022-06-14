import 'package:flutter/material.dart';


class ForecastBtnState with ChangeNotifier{


   bool _isActive = false;
   bool get active => _isActive;


   void buttonActive(){
     _isActive = true;
     notifyListeners();
   }

   void buttonInactive(){
     _isActive = false;
     notifyListeners();
   }

}