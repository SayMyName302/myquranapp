import 'package:flutter/material.dart';

class PrayerCards extends StatelessWidget {
  const PrayerCards({super.key});

  @override
@override
Widget build(BuildContext context) {
  return Container(
   
    height: 120,// set width of container to screen width
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Card(elevation: 0,
        color: Colors.transparent,
          child: Container(
        
                 // set width of card to 1/5th of screen width
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/image${index + 1}.jpg', // use index to load different images
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

}