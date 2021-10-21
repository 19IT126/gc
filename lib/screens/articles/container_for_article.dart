import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';

class ArticleContainer extends StatefulWidget {
  DocumentSnapshot documentSnapshot;
  ArticleContainer(BuildContext context, DocumentSnapshot<Object> document) {
    documentSnapshot = document;
  }

  @override
  _ArticleContainerState createState() => _ArticleContainerState();
}

class _ArticleContainerState extends State<ArticleContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsScreen(context, widget.documentSnapshot),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'articleContainer',
              child: Container(
                height: 220.0,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFDCEDC8),
                  borderRadius: BorderRadius.circular(24.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.documentSnapshot['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            bottom: 16.0,
            child: Text(
              widget.documentSnapshot['title'],
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
