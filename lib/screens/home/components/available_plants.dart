import 'package:flutter/material.dart';
import 'package:gc/screens/articles/container_for_article.dart';
import 'package:gc/screens/details/details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gc/screens/home/components/available_plant_card.dart';

import '../../../constants.dart';

class AvailablePlants extends StatelessWidget {
  const AvailablePlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: <Widget>[
    //       RecomendPlantCard(
    //         image: "assets/images/image_1.png",
    //         title: "Samantha",
    //         country: "Russia",
    //         price: 440,
    //         press: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => DetailsScreen(),
    //             ),
    //           );
    //         },
    //       ),
    //       RecomendPlantCard(
    //         image: "assets/images/image_2.png",
    //         title: "Angelica",
    //         country: "Russia",
    //         price: 440,
    //         press: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => DetailsScreen(),
    //             ),
    //           );
    //         },
    //       ),
    //       RecomendPlantCard(
    //         image: "assets/images/image_3.png",
    //         title: "Samantha",
    //         country: "Russia",
    //         price: 440,
    //         press: () {},
    //       ),
    //     ],
    //   ),
    // );
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Plants').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
              return AvailablePlantCard(context, document);
            }).toList()),
          );
        });
  }
}
