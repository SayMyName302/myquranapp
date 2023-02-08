import 'package:flutter/material.dart';



 Widget buildImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                'https://img.freepik.com/premium-vector/landscape-mosque-desert-that-looks-beautiful-purple_205077-244.jpg',
              ),
         
              child: InkWell(
                onTap: () {},
              ),
              height: 240,
              fit: BoxFit.cover,
            ),
            const Text(
              'Card With Splash',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      );

        Widget buildQuoteCard() => Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'If life were predictable it would cease to be life, and be without flavor.',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 12),
              Text(
                'Eleanor Roosevelt',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );