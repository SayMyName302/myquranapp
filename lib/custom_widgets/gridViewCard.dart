import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final String image1;
  final String image2;

  const MyCustomWidget({
    Key? key,
    required this.title1,
    required this.title2,
    required this.image1,
    required this.image2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(
                    image1,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title1,
                      style: TextStyle(fontSize: 13, fontFamily: 'Raleway'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(
                    image2,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title2,
                      style: TextStyle(fontSize: 13, fontFamily: 'Raleway'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
