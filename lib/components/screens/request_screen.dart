import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_hunger/components/widgets/text_feild.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/styles.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

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
                      Icons.help_outline,
                      size: 35,
                    ),
                  ),
                  Text(
                    'Request',
                    style: Styles().bigTitleTextStyle,
                  )
                ],
              ),
            ),
            CustomTextField(
              hint: 'Title',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              hint: 'How many persons',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.number,
              topMargin: 20,
              size: _size,
            ),
            CustomTextField(
              hint: 'Description',
              controller: null,
              isObsecure: false,
              inputType: TextInputType.text,
              topMargin: 20,
              size: _size,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text(
          'Ask',
          style: Styles().simpleTextStyle,
        ),
      ),
    );
  }
}
