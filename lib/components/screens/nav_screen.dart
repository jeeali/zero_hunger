import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:zero_hunger/components/screens/explore_screen.dart';
import 'package:zero_hunger/components/screens/my_donations_screen.dart';
import 'package:zero_hunger/components/screens/profile_screen.dart';
import 'package:zero_hunger/components/screens/recent_screen.dart';
import 'package:zero_hunger/components/screens/request_screen.dart';

class NavScreen extends StatefulWidget {

  final bool isDonor;

  const NavScreen({Key key, @required this.isDonor}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            _exploreTab(),
            _requestTab(),
            widget.isDonor ? _myDonationsTab() :
            _recentTab(),
            _profileTab(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
//          _pageController.jumpToPage(index);
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'Explore',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.normal
              ),
            ),
            icon: Icon(OMIcons.home),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            title: Text(
              'Request',
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.normal
              ),
            ),
            icon: Icon(Icons.help_outline),
            activeColor: Colors.purple,
            inactiveColor: Colors.black,
          ),
          widget.isDonor ? BottomNavyBarItem(
            title: Text(
              'Donations',
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.normal
              ),
            ),
            icon: Icon(Icons.record_voice_over),
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ) :
          BottomNavyBarItem(
            title: Text(
              'Recent',
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.normal
              ),
            ),
            icon: Icon(Icons.timelapse),
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
              title: Text(
                'Profile',
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.normal
                ),
              ),
            icon: Icon(Icons.person_outline),
            activeColor: Colors.teal,
            inactiveColor: Colors.black
          ),
        ],
      ),
    );
  }

  _exploreTab() => ExploreScreen(isDonor: widget.isDonor,);

  _requestTab() => RequestScreen(isDonor: widget.isDonor,);

  _myDonationsTab() => MyDonationsScreen();

  _recentTab() => RecentScreen();

  _profileTab() => ProfileScreen(isDonor: widget.isDonor,);

}
