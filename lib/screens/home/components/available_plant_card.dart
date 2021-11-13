import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gc/screens/articles/article_screen.dart';
import 'package:gc/screens/articles/details_screen.dart';
import 'package:gc/screens/home/components/plant_description.dart';

import '../../../constants.dart';

class AvailablePlantCard extends StatefulWidget {
  DocumentSnapshot documentSnapshot;
  AvailablePlantCard(BuildContext context, DocumentSnapshot<Object> document) {
    documentSnapshot = document;
  }

  @override
  _AvailablePlantCardState createState() => _AvailablePlantCardState();
}

class _AvailablePlantCardState extends State<AvailablePlantCard> {
  @override
  Widget build(BuildContext context) {
    String image = widget.documentSnapshot['Image_Link'];
    String title = widget.documentSnapshot['C_Name'];
    Function press = () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlantDescription(widget.documentSnapshot),
        ),
      );
    };
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.network(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
