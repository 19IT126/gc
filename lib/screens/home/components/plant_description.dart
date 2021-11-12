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
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//todo:Fetch Plant ID from the caller's page to use with firebase
//todo : fetch image url of the plant from firestore
//todo:fetch plant's botanical name and common name from the firebase
//todo:fetch details regarding water,sunlight care and interval

class PlantDescription extends StatefulWidget {
  PlantDescription(DocumentSnapshot<Object> documentSnapshot) {
    botanicalName = documentSnapshot['B_Name'];
    commonName = documentSnapshot['C_Name'];
    imageURL = documentSnapshot['Image_Link'];
    sunlight = documentSnapshot['Sunlight'];
    water = documentSnapshot['Water'];
    care = documentSnapshot['Care'];
    interval = 2;
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
                                fontStyle: FontStyle.italic // light
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
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
                                  'https://empire-s3-production.bobvila.com/articles/wp-content/uploads/2017/09/The-Dos-and-Donts-of-Watering-Plants.jpg'),
                              fit: BoxFit.cover,
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
                              style: new TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold, // light
                                fontStyle: FontStyle.italic,
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
                                  'https://thepracticalplanter.com/wp-content/uploads/2019/06/Plant-in-Sunlight.jpg'),
                              fit: BoxFit.cover,
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
                              style: new TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold, // light
                                fontStyle: FontStyle.italic,
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
                                  'https://images.ctfassets.net/i3tkg7dt3kro/2AB900W1DvJsF3VN6Ja0ge/fc84c6b70eb42348bb0605b92dc5a328/top-plant-care-tips-1-1.jpg'),
                              fit: BoxFit.cover,
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
                              style: new TextStyle(
                                //fontFamily: "Roboto",
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold, // light
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //todo:Add Plant to firebase data of the user
                  FloatingActionButton.extended(
                    onPressed: () {},
                    label: const Text('Add Plant'),
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
