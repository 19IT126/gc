import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gc/screens/garden/plant_desc.dart';

import '../../constants.dart';

class PlantContainer extends StatefulWidget {
  DocumentSnapshot documentSnapshot;
  PlantContainer(BuildContext context, DocumentSnapshot<Object> document) {
    documentSnapshot = document;
  }

  @override
  _PlantContainerState createState() => _PlantContainerState();
}

class _PlantContainerState extends State<PlantContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              AddedPlantDescription(context, widget.documentSnapshot),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 96,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 12,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 5.0),
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.documentSnapshot['Image_Link']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              Expanded(
                child: Text(
                  widget.documentSnapshot['C_Name'],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kPrimaryColor.withOpacity(0.6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
