import 'package:flutter/material.dart';

Color getchipcolour(String status){

  if(status=='Pending'){
    return Color.lerp(Colors.orangeAccent, Colors.white, 0.8)!;
  }

  else if(status=='Solved'){
    return Color.lerp(Colors.green, Colors.white, 0.8)!;

  }
  else
    {
      return Color.lerp(Colors.red, Colors.white, 0.8)!;

    }
}