import 'package:flutter/material.dart';

class ImageListWithText extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> imageTexts;

  const ImageListWithText({
    Key? key,
    required this.imagePaths,
    required this.imageTexts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width / 7;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        5,
        (index) => Column(
          children: [
            Image.asset(
              imagePaths[index],
              width: imageWidth,
              height: imageWidth,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              imageTexts[index],
              style: TextStyle(fontSize: 13,fontFamily: 'Raleway',),
            ),
          ],
        ),
      ),
    );
  }
}
