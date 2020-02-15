import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/styles.dart';
import '../../utils/draw_circle.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyLiquidScreen extends StatefulWidget {
  @override
  _MyLiquidScreenState createState() => _MyLiquidScreenState();
}

class _MyLiquidScreenState extends State<MyLiquidScreen> {

  @override
  void initState() {
    getNewbiePreference().then((isNewbie) {
      if (isNewbie != null) {
        getIdPreference().then((userId) {
          if (userId != null) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/navigation', ModalRoute.withName('/navigation'));
          } else {
            // Stay Here
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    List<String> messages = [
      "Restaurants cook food every day!",
      "Sometimes end up in trash!",
      "Do\'t Waste, Donate Food!",
    ];

    final pages = [
      Container(
        color: Colorz.screen1,
        width: _size.width/1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: _size.width/1.5,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/chef.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  messages[0],
                  maxLines: 2,
                  style: SubHeadingStylesMaterial.light,
                ),
                Divider(
                  height: 60,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () => _startBtn(),
                  child: Container(
                    width: 200,
                    height: 60,
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          'Login',
                          style: HeadingStylesGradient.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    DrawCircle(color: Colors.white),
                    DrawCircle(color: Color(0xFFBDBDBD)),
                    DrawCircle(color: Color(0xFFBDBDBD)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        color: Colorz.screen2,
        width: _size.width/1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: _size.width/1.5,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/trash.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  messages[1],
                  style: SubHeadingStylesMaterial.light,
                ),
                Divider(
                  height: 60,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () => _startBtn(),
                  child: Container(
                    width: 200,
                    height: 60,
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          'Login',
                          style: HeadingStylesGradient.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    DrawCircle(color: Color(0xFFBDBDBD)),
                    DrawCircle(color: Colors.white),
                    DrawCircle(color: Color(0xFFBDBDBD)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        color: Colorz.screen3,
        width: _size.width/1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: _size.width/1.5,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/icecream.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  messages[2],
                  style: SubHeadingStylesMaterial.light,
                ),
                Divider(
                  height: 60,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () => _startBtn(),
                  child: Container(
                    width: 200,
                    height: 60,
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          'Login',
                          style: HeadingStylesGradient.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    DrawCircle(color: Color(0xFFBDBDBD)),
                    DrawCircle(color: Color(0xFFBDBDBD)),
                    DrawCircle(color: Colors.white),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ];

    return Builder(
      builder: (context) => LiquidSwipe(
        pages: pages,
        initialPage: 0,
        fullTransitionValue: 350.0,
        enableLoop: true,
        waveType: WaveType.liquidReveal,
      ),
    );
  }

  _startBtn() {
    saveNewbiePreference(false).then((_) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/navigation', ModalRoute.withName('/navigation'));
    });
  }

  Future saveNewbiePreference(bool isNewbie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isNewbie", isNewbie);
  }

  Future<bool> getNewbiePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isNewbie");
  }

  Future<String> getIdPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id");
  }
}
