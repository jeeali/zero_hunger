import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_hunger/components/widgets/text_feild.dart';
import 'package:zero_hunger/utils/colors.dart';
import 'package:zero_hunger/utils/strings.dart';
import 'package:zero_hunger/utils/styles.dart';

class RequestScreen extends StatefulWidget {

  final bool isDonor;

  const RequestScreen({Key key, @required this.isDonor}) : super(key: key);

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.isDonor ? Strings.give : Strings.request,
                        style: Styles().bigTitleTextStyle,
                      ),
                      Text(
                        widget.isDonor ? Strings.subGive : Strings.subRequest,
                        style: Styles().simpleTextStyle,
                      )
                    ],
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
          widget.isDonor ? 'Give' :'Ask',
          style: Styles().simpleTextStyle,
        ),
      ),
    );
  }
}
