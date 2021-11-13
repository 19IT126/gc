import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

String botanicalName;
String commonName;
String imageURL;
String sunlight;
String care;
String water;
int interval;
String desc;

class PlantDescription extends StatefulWidget {
  PlantDescription(DocumentSnapshot<Object> documentSnapshot) {
    botanicalName = documentSnapshot['B_Name'];
    commonName = documentSnapshot['C_Name'];
    imageURL = documentSnapshot['Image_Link'];
    sunlight = documentSnapshot['Sunlight'];
    water = documentSnapshot['Water'];
    care = documentSnapshot['Care'];
    desc = documentSnapshot['desc'];
    interval = documentSnapshot['Interval'];
  }

  //PlantDescription({Key? key, required this.title}) : super(key: key);
  //final String title;
  @override
  _PlantDescriptionState createState() => _PlantDescriptionState();
}

class _PlantDescriptionState extends State<PlantDescription> {
  Event buildEvent() {
    return Event(
      title: 'Garden Central',
      description: 'Your $commonName needs your care!',
      //location: 'Flutter app',
      startDate: DateTime.now().add(Duration(minutes: 30)),
      endDate: DateTime.now().add(Duration(minutes: 60)),
      allDay: false,
      iosParams: IOSParams(
        reminder: Duration(minutes: 40),
      ),
      // androidParams: AndroidParams(
      //   emailInvites: ["test@example.com"],
      // ),
      recurrence: Recurrence(
        frequency: Frequency.daily,
        interval: interval,
        ocurrences: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.58,
              child: Container(
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    //topLeft: Radius.circular(50),
                    //topRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFFDCF5F1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Botanical Name',
                            style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold, // light
                            ),
                          ),
                          Text(
                            botanicalName,
                            style: new TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic // light
                                ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Common Name',
                            style: new TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold, // light
                            ),
                          ),
                          //todo:fetch plant's common name from the firebase
                          Text(
                            commonName,
                            style: new TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16.0,
                                fontStyle: FontStyle.normal // light
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.29,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.29,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/616/616712.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.29,
                          decoration: BoxDecoration(
                            //color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                water,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold, // light
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.29,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.29,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/1294/1294792.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.29,
                          decoration: BoxDecoration(
                            //color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                sunlight,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold, // light
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.29,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.29,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/2674/2674327.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.29,
                          decoration: BoxDecoration(
                            //color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                care,
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                  //fontFamily: "Roboto",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold, // light
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 24.0),
                child: Text(
                  desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "Mulish-SemiBold",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //todo:Add Plant to firebase data of the user
                  FloatingActionButton.extended(
                    onPressed: () {},
                    label: const Text('ADD PLANT'),
                    icon: const Icon(Icons.add),
                    backgroundColor: Color(0xff5BC28D),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Add2Calendar.addEvent2Cal(buildEvent());
                    },
                    label: const Text('Remind'),
                    icon: const Icon(Icons.calendar_today),
                    backgroundColor: Color(0xff5BC28D),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
