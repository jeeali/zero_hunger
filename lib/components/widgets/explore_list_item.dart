import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:zero_hunger/utils/styles.dart';

class ExploreListItem extends StatelessWidget {
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
                  '2 Person\'s Food',
                  style: Styles().titleTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                'We had a final executive dinner tonight. Some food left after the party.',
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
                      '2 Persons',
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
