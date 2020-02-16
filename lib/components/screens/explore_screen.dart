import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/components/widgets/explore_list_item.dart';
import 'package:zero_hunger/components/widgets/n_explore_list_item.dart';
import 'package:zero_hunger/models/Donation.dart';
import 'package:zero_hunger/utils/strings.dart';
import 'package:zero_hunger/utils/styles.dart';
import 'package:zero_hunger/utils/utils.dart';
import 'package:http/http.dart' as http;

class ExploreScreen extends StatefulWidget {

  final bool isDonor;

  const ExploreScreen({Key key, @required this.isDonor}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  Future getData() async {
    try {
      var response = await http.post(
          Uri.encodeFull(
            Utils.users,
          ),
          headers: {"Accept": "application/json"});
      List data;
      var extractedData = json.decode(response.body);
      data = extractedData['data'];
      for(int i=0; i< data.length; i++){
        setState(() {
          _list.add(Donation(data[i]['title'], data[i]['desc'], 'Lahore', data[i]['persons'], data[i]['updates_at']));
        });
      }
    } on Exception catch (e) {
      debugPrint("Exception Catched: ${e.toString()}");
      // 33 is the ERR CODE
      return '33';
    }
  }

  List<Donation> _list = new List<Donation>();
  bool _loading = true;

  ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    getFnamePreference().then((fName) {
      getLnamePreference().then((lName) {
        getEmailPreference().then((email) {

        });
      });
    });
    super.initState();
    _isVisible = true;
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      print("listener");
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: _isVisible ? _size.height / 5.5 : 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: kToolbarHeight, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          OMIcons.home,
                          size: _isVisible ? 35 : 0.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Strings.explore,
                            style: Styles().bigTitleTextStyle,
                          ),
                          Text(
                            Strings.subExplore,
                            style: Styles().simpleTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: _isVisible ? 24 : 0,
                    onPressed: (){},
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                controller: _scrollController,
//                itemCount: _list.length,
//                itemBuilder: (context, index){
//                  return NExploreListItem(
//                    title: _list[index].title,
//                    desc: _list[index].description,
//                    person: _list[index].persons,
//                  );
//                },
                children: <Widget>[
                  ExploreListItem(),
                  ExploreListItem(),
                  ExploreListItem(),
                  ExploreListItem(),
                  ExploreListItem(),
                  ExploreListItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> getFnamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fName");
  }
  Future<String> getLnamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lName");
  }
  Future<String> getEmailPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

}
