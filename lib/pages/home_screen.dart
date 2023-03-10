import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:quranapp/consts/consts.dart';
import 'package:quranapp/custom_widgets/gridViewCard.dart';

import 'package:quranapp/time.dart';

import 'package:quranapp/custom_widgets/cardview.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quranapp/models/aya_of_the_day.dart';
import 'package:quranapp/services/api_services.dart';

import 'package:quranapp/consts/strings.dart';

import '../date.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<AyaOfTheday> _ayaOfTheDayFuture;
  ApiServices _apiServices = ApiServices();
  static Color darkBlue = const Color.fromARGB(255, 0, 108, 114);
  String newText = 'OK';
  String _timeString = "00:00";
  String _prayer = '';
  @override
  void initState() {
    super.initState();
    _ayaOfTheDayFuture = _apiServices.getAyaOfTheDay();
    CurrentDate.getCurrentDate().then((date) {
      setState(() {
        newText = date;
      });
    });
    CurrentTime.getCurrentTime((time) {
      setState(() {
        _timeString = time;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 200.0;
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hirji = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EE , d MMM yyyy');
    var formatted = format.format(day);

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 950,
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: cardWidth,
                      height: 220,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/purplemasjid.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                newText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'RalewayMedium',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                    child: Text(
                                  _hirji.hDay.toString() + ' ',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: 'RalewayMedium'),
                                )),
                                WidgetSpan(
                                  child: Text(
                                    _hirji.longMonthName + ' ',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontFamily: 'RalewayMedium',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Text('${_hirji.hYear} AH',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'RalewayMedium')),
                                ),
                              ])),
                            ),
                          ),
                          Center(
                            child: Text(
                              _timeString,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: card2Width,
                      height: 220,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  FutureBuilder<AyaOfTheday>(
                                      future: _ayaOfTheDayFuture,
                                      builder: (context, snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.none:
                                            return const Icon(
                                                Icons.sync_problem);
                                          case ConnectionState.waiting:
                                          case ConnectionState.active:
                                            return Container(
                                                alignment: Alignment.center,
                                                child:
                                                    const CircularProgressIndicator());
                                          case ConnectionState.done:
                                            return SingleChildScrollView(
                                              child: SizedBox(
                                                height: 500,
                                                width: card2Width,
                                                child: Wrap(
                                                  spacing:
                                                      2, // spacing between items
                                                  runSpacing: 2,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/quran.png',
                                                          width: 25,
                                                          height: 25,
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text(
                                                          "Quran Aya of the Day",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            width: 99),
                                                        const Icon(
                                                          Icons.share,
                                                          color: Colors.red,
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(
                                                      color: Colors.black,
                                                      thickness: 0.5,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 30),
                                                      child: Center(
                                                        child: Text(
                                                          snapshot
                                                              .data!.arText!,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Raleway',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 30),
                                                      child: Center(
                                                        child: Text(
                                                          snapshot
                                                              .data!.enTran!,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Raleway',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(children: <
                                                          InlineSpan>[
                                                        WidgetSpan(
                                                          child: Text(
                                                            snapshot.data!
                                                                .surNumber!
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .red), // Padding
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                            text: '  '),
                                                        WidgetSpan(
                                                          child: Text(
                                                            snapshot.data!
                                                                .surEnName!,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .red),
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                        }
                                      })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 440,
                  child: Container(
                    width: card2Width,
                    height: 220,
                    child: Stack(
                      children: const [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Prayer Timing',
                            style: (TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 470,
                  child: Container(
                    width: card2Width,
                    height: 220,
                    child: Stack(
                      children: const <Widget>[
                        Expanded(
                          child: ImageListWithText(
                            imageTexts: [
                              'Fajar',
                              'Zohr',
                              'Asar',
                              'Maghrib',
                              'Isha',
                            ],
                            imagePaths: [
                              'assets/image1.png',
                              'assets/image2.png',
                              'assets/image3.png',
                              'assets/image4.png',
                              'assets/image5.png',
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 570,
                  child: Container(
                    width: card2Width,
                    height: 220,
                    child: Stack(
                      children: const [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Explore',
                            style: (TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 600,
                  child: Container(
                    width: card2Width,
                    height: 220,
                    child: Stack(
                      children: const [
                        MyCustomWidget(
                            title1: 'Full Quran',
                            title2: 'Search',
                            image1: 'assets/quranicon.png',
                            image2: 'assets/search.png')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 700,
                  child: Container(
                    width: card2Width,
                    height: 220,
                    child: Stack(
                      children: const [
                        MyCustomWidget(
                            title1: 'Quran Milestone',
                            title2: 'Qibla Direction',
                            image1: 'assets/milestones.png',
                            image2: 'assets/qibla.png')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 800,
                  child: Container(
                    width: card2Width,
                    height: 220,
                    child: Stack(
                      children: const [
                        MyCustomWidget(
                            title1: 'Bookmarks',
                            title2: 'Quran Info',
                            image1: 'assets/bookmark.png',
                            image2: 'assets/information.png')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
