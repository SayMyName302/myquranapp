import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:quranapp/consts/consts.dart';
import 'package:quranapp/custom_widgets/image_card.dart';
import 'package:quranapp/time.dart';
import 'package:hijri/digits_converter.dart';
import 'package:hijri/hijri_array.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quranapp/models/aya_of_the_day.dart';
import 'package:quranapp/services/api_services.dart';

import '../date.dart';
class HomeScreen extends StatefulWidget {
  
  
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   static Color darkBlue = Color.fromARGB(255,0,108,114);
  String newText='OK';
     String _timeString = "00:00";
     String _prayer = '';
   @override
  void initState() {
    super.initState();

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
    var _size=MediaQuery.of(context).size;
HijriCalendar.setLocal('ar');
     var _hirji=HijriCalendar.now();
     var day=DateTime.now();
     var format=DateFormat('EE , d MMM yyyy');
     var formatted=format.format(day);
    
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: cardWidth,
            height: 220,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://img.freepik.com/premium-vector/landscape-mosque-desert-that-looks-beautiful-purple_205077-244.jpg"
                ),
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
                    child: Text(newText,

                   
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
                child: RichText(text: TextSpan(
                            children:<InlineSpan> [
                              WidgetSpan(
                               
                               
                                child: Text( _hirji.hDay.toString()+' ',
                                
                                style: const TextStyle(fontSize: 17,color: Color.fromARGB(255, 255, 255, 255),fontFamily: 'RalewayMedium'),)
                          
                              ),
                                 WidgetSpan(
                               child: Text(_hirji.longMonthName+' ',style: const TextStyle(fontSize: 17,color: Color.fromARGB(255, 255, 255, 255),fontFamily: 'RalewayMedium',fontWeight: FontWeight.bold),),
                               
                          
                          
                              ),
                                 WidgetSpan(
                                child: Text('${_hirji.hYear} AH',style: const TextStyle(fontSize: 17,color: Color.fromARGB(255, 255, 255, 255),fontFamily: 'RalewayMedium')),
                               
                          
                          
                              ),
                          
                            ]
                          )),
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
        height: 140,
        child: Stack(
          children:  [
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
       
                  children: [
                    Image(image: AssetImage('assets/quran.png'),
                    height: 25,
                    width: 25,
                    ),
                    const SizedBox(width: 10),
                    const Text('Aya Of the Day',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RalewayMedium',
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                  
                      ),
                  
                    ),
                     
                  ],
                  
                ),
              ),
            ),
             Positioned(
              top: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.share,color: darkBlue,),
              ),
            ),
          Column(
                        children: [
                          const Text(
                            "Quran Aya of the Day",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),]
          )
          ],
          
        ),

      ),
      
        
          
        ),
      ),
    ],
  ),
),

    );
  }
}
