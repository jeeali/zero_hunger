import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:zero_hunger/utils/styles.dart';

class NExploreListItem extends StatelessWidget {

  final String title;
  final String person;
  final String desc;

  const NExploreListItem({Key key, this.title, this.person, this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(OMIcons.fastfood),
                ),
                Text(
                  title,
                  style: Styles().titleTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                desc,
                style: Styles().subTitleTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(OMIcons.pinDrop),
                    ),
                    Text(
                      'Gulberg, Lahore',
                      style: Styles().simpleTextStyle,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('.', style: Styles().simpleTitleTextStyle,),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(OMIcons.person),
                    ),
                    Text(
                      '${person} Persons',
                      style: Styles().simpleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(OMIcons.timelapse),
                ),
                Text(
                  '20 mins ago',
                  style: Styles().simpleTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
