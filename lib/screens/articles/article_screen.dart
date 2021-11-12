import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:gc/screens/articles/container_for_article.dart';

import '../../constants.dart';

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('articles').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
              // return Center(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width / 1.2,
              //     height: MediaQuery.of(context).size.height / 6,
              //     child: Text("Title: " + document['title']),
              //   ),
              // );

              return ArticleContainer(context, document);
            }).toList());
          }),
    );
  }
}
