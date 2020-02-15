import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:zero_hunger/components/widgets/explore_list_item.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/styles.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colorz.baseColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      minRadius: 26,
                      child: Icon(
                        Icons.person_outline,
                        size: 35,
                      ),
                    ),
                  ),
                  Text(
                    'Alex',
                    style: Styles().bigTitleTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                'alex@gmail.com',
                style: TextStyle(
                    fontFamily: Styles.font,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                color: Colorz.baseColor,
                child: ClayContainer(
                  color: Colorz.baseColor,
                  borderRadius: 50,
                  curveType: CurveType.concave,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                    child: Text(
                      'Verified'.toUpperCase(),
                      style: TextStyle(
                        fontFamily: Styles.font,
                        color: Colors.green,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
