import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class DetailsScreen extends StatefulWidget {
  DocumentSnapshot _documentSnapshot;
  DetailsScreen(
      BuildContext context, DocumentSnapshot<Object> documentSnapshot) {
    _documentSnapshot = documentSnapshot;
  }

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'articleImage',
            child: Image(
              image: NetworkImage(widget._documentSnapshot['image']),
              height: size.height / 2.3,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Text(
              widget._documentSnapshot['title'],
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 1.0,
            indent: 23.0,
            endIndent: 23.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: Text(
                  widget._documentSnapshot['desc'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "Mulish-SemiBold",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
