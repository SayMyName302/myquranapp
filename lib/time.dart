import 'dart:async';

import 'package:flutter/material.dart';

class TimeShow extends StatefulWidget {
  const TimeShow({super.key});

  @override
  State<TimeShow> createState() => _TimeShowState();
}

class _TimeShowState extends State<TimeShow> {

late int H;
  late int h;
 late  int m;
late  int s;
  @override
void initState() {
  super.initState();
H=DateTime.now().hour;
h=(DateTime.now().hour>12) ?DateTime.now().hour-12: (DateTime.now().hour==0)?12: DateTime.now().hour;
m=DateTime.now() .minute;
s=DateTime.now().second;
Timer.periodic (const Duration (seconds: 1), (Timer t)=>getTime());
}

getTime() 
{
  setState((){
H=DateTime.now().hour;
h=(DateTime.now().hour>12) ?DateTime.now().hour-12: (DateTime.now().hour==0)?12: DateTime.now().hour;
m-DateTime.now() .minute;
3-DateTime.now().second;
});
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}