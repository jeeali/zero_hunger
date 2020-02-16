import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/styles.dart';

class ProfileScreen extends StatefulWidget {

  final bool isDonor;

  const ProfileScreen({Key key, @required this.isDonor}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;




    return Scaffold(
      backgroundColor: Colorz.baseColor,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: Card(
                color: Colors.green.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Text(
                    'verified'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: Styles.font,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
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
//            Padding(
//              padding: const EdgeInsets.only(top: 20),
//              child: Container(
//                color: Colorz.baseColor,
//                child: ClayContainer(
//                  color: Colorz.baseColor,
//                  borderRadius: 50,
//                  curveType: CurveType.concave,
//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
//                    child: Text(
//                      'Verified'.toUpperCase(),
//                      style: TextStyle(
//                        fontFamily: Styles.font,
//                        color: Colors.green,
//                        fontSize: 18
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
