import 'package:flutter/material.dart';

import 'package:quranapp/consts/consts.dart';
import 'package:quranapp/custom_widgets/image_card.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var time =DateTime.now();
    var screenWidth = MediaQuery.of(context).size.width;
    var cardWidth = screenWidth * 0.95;
    var screenWidth2ndcard = MediaQuery.of(context).size.width;
    var card2Width = screenWidth2ndcard * 0.89;
    return Scaffold(
      appBar: AppBar(     
        elevation: 0,
        centerTitle: true,
        title: const Text('Home', style: TextStyle(color: Colors.black)),
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10,
                color: const Color.fromARGB(255, 63, 64, 151),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20)), // RoundedRectangleBorder
                child: Container(
                  width: cardWidth,
                  height: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/premium-vector/landscape-mosque-desert-that-looks-beautiful-purple_205077-244.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: const Center(
                child: Text("Some Text", style: TextStyle(color: Colors.white),),
              ),
                ),
              ),
            ),
            Positioned(
              top: 195,
              child: Card(
                elevation: 10,
                color: const Color.fromARGB(255, 236, 235, 235),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20)), // RoundedRectangleBorder
                child: Container(
                  width: card2Width,
                  height: 140,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
