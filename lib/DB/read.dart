import 'dart:convert';

import 'package:flutter/services.dart';

late Map<String, dynamic> catalogdata ;
  
 Future<List> loadData() async {
      var data =
          await rootBundle.loadString("assests/cookies.json");
      catalogdata = await json.decode(data);
      var newdata= catalogdata["cookies"];
      return newdata;
    } 
