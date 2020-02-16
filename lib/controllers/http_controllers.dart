import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/utils.dart';

class HttpControllers {



  //* * * * * * *   USERS   * * * * * * *
//  Future users({String fName, String lName, String email}) async {
//    try {
//      var response = await http.post(
//          Uri.encodeFull(
//            Utils.users,
//          ),
//          body: {
//            "first_name": fName,
//            "last_name": lName,
//            "email": email
//          },
//          headers: {"Accept": "application/json"});
//      debugPrint("Response: " + response.body);
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        return response.body;
//      } else {
//        // 33 is the ERR CODE
//        return '33';
//      }
//    } on Exception catch (e) {
//      debugPrint("Exception Catched: ${e.toString()}");
//      // 33 is the ERR CODE
//      return '33';
//    }
//  }

}
