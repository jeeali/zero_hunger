import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/controllers/http_controllers.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/snack_bar.dart';
import 'package:zero_hunger/utils/styles.dart';
import 'package:zero_hunger/utils/utils.dart';
import '../../utils/draw_circle.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:http/http.dart' as http;

class MyLiquidScreen extends StatefulWidget {
  @override
  _MyLiquidScreenState createState() => _MyLiquidScreenState();
}

class _MyLiquidScreenState extends State<MyLiquidScreen> {


  Future users({String fName, String lName, String email}) async {
    try {
      var response = await http.post(
          Uri.encodeFull(
            Utils.users,
          ),
          body: {
            "first_name": fName,
            "last_name": lName,
            "email": email
          },
          headers: {"Accept": "application/json"});
      debugPrint("Response: " + response.body);
      if (response.statusCode == 201) {
//        List data;
//        var extractedData = json.decode(response.body);
//        data = extractedData['data'];
//        _saveBasicProfilePreference(
//          id: data[0]['id'],
//          fName: data[0]['first_name'],
//          lName: data[0]['last_name'],
//          email: data[0]['email']
//        );
        debugPrint('tuhuuuu');
            Navigator.pushNamedAndRemoveUntil(
                context, '/register', ModalRoute.withName('/register'));
        return response.body;
      } else if(response.statusCode == 200){
        Navigator.pushNamedAndRemoveUntil(
            context, '/register', ModalRoute.withName('/register'));
      } else {
        // 33 is the ERR CODE
        return '33';
      }
    } on Exception catch (e) {
      debugPrint("Exception Catched: ${e.toString()}");
      // 33 is the ERR CODE
      return '33';
    }
  }


  final GlobalKey<ScaffoldState> mScaffoldState =
  new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getIdPreference().then((userId) {
      if (userId != null) {
        getTypePreference().then((value){
          if(value){
            Navigator.pushNamedAndRemoveUntil(
                context, '/donor_navigation', ModalRoute.withName('/donor_navigation'));
          } else{
            Navigator.pushNamedAndRemoveUntil(
                context, '/rec_navigation', ModalRoute.withName('/rec_navigation'));
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
                _btn(),
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
                _btn(),
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
                _btn(),
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
      builder: (context) => Scaffold(
        key: mScaffoldState,
        body: LiquidSwipe(
          pages: pages,
          initialPage: 0,
          fullTransitionValue: 350.0,
          enableLoop: true,
          waveType: WaveType.liquidReveal,
        ),
      ),
    );
  }

  Widget _btn(){
    return InkWell(
      onTap: () => _startBtn(),
      child: Container(
        width: 200,
        height: 60,
        child: Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
              ),
              Text(
                'Login',
                style: HeadingStylesGradient.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void initiateFacebookLogin() async {
    debugPrint('FaceBook login initiated');
    var facebookLogin = FacebookLogin();
//    facebookLogin.setReadPermissions("email", "public_profile", "user_friends");
    var facebookLoginResult =
    await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        Sbar().showSnackBar('Access Denied', mScaffoldState);
        throw new StateError(facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        Sbar().showSnackBar('Cancelled by User', mScaffoldState);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        debugPrint('Logged In as: ${profile['first_name']}');
        debugPrint('Logged In as: ${profile['last_name']}');
        debugPrint('Logged In as: ${profile['email']}');
//        Navigator.pushNamedAndRemoveUntil(
//            context, '/rec_navigation', ModalRoute.withName('/rec_navigation'));
        users(
          fName: profile['first_name'],
          lName: profile['last_name'],
          email: profile['email']
        );
        break;
    }
  }

  _startBtn() {
    initiateFacebookLogin();
  }

  Future<String> getIdPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id");
  }
  Future<bool> getTypePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("user_type");
  }

  Future _saveBasicProfilePreference({String id, String fName, String lName, String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("id", id);
    await prefs.setString("fName", fName);
    await prefs.setString("lName", lName);
    await prefs.setString("email", email);
  }
}
