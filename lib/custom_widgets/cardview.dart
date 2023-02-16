import 'package:flutter/material.dart';

class HorizontalImageList extends StatelessWidget {
  final List<String> imageTexts;

  const HorizontalImageList({Key? key, required this.imageTexts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageTexts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/image${index + 1}.jpg',
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 5.0),
                Text( 
                  imageTexts[index],
                  style: TextStyle(fontSize: 14.0,fontFamily: 'Raleway'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
