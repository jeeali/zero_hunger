import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:zero_hunger/components/widgets/explore_list_item.dart';
import 'package:zero_hunger/components/widgets/my_donation_list_item.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/styles.dart';

class MyDonationsScreen extends StatefulWidget {
  @override
  _MyDonationsScreenState createState() => _MyDonationsScreenState();
}

class _MyDonationsScreenState extends State<MyDonationsScreen> {

  ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.record_voice_over,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Donations',
                    style: Styles().bigTitleTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                controller: _scrollController,
                children: <Widget>[
                  MyDonationListItem(),
                  MyDonationListItem(),
                  MyDonationListItem(),
                  MyDonationListItem(),
                  MyDonationListItem(),
                  MyDonationListItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
