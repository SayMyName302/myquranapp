import 'package:flutter/material.dart';

class HorizontalImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/image${index + 1}.jpg',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
