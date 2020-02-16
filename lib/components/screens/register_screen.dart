import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zero_hunger/components/widgets/text_feild.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/strings.dart';
import 'package:zero_hunger/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String _userId;
  bool _isDonor = true;
  String donation = 'Weekly';

  @override
  void initState() {
    getIdPreference().then((value) {
      setState(() => _userId = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colorz.baseColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: kToolbarHeight, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.person_outline,
                      size: 35,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Strings.profile,
                        style: Styles().bigTitleTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            CustomTextField(
              hint: 'Name',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              hint: 'Location',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.number,
              topMargin: 20,
              size: _size,
            ),

            RadioListTile(
              title: Text('Donor'),
              value: true,
              groupValue: _isDonor,
              onChanged: (value) {
                setState(() { _isDonor = value; });
              },
            ),
            RadioListTile(
              title: Text('Recipient'),
              value: false,
              groupValue: _isDonor,
              onChanged: (value) {
                setState(() { _isDonor = value; });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          _isDonor ? _donor() : _rec();
        },
        label: Text(
          'Register',
          style: Styles().simpleTextStyle,
        ),
      ),
    );
  }

  Future<String> getIdPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("id");
  }

  _rec() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/rec_navigation', ModalRoute.withName('/rec_navigation'));
  }

  _donor() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/donor_navigation', ModalRoute.withName('/donor_navigation'));
  }

}
