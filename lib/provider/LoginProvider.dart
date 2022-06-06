import 'dart:convert';


import 'package:api_get_post/model/Userdata.dart';
import 'package:api_get_post/utility/ApiHandler.dart';
import 'package:api_get_post/utility/ErrorHandler.dart';
import 'package:api_get_post/utility/NoConcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resource/UrlResources.dart';

class LoginProvider extends ChangeNotifier {
  var islogin = false;

  userdata obj;

  //also call this
 // List<userdata> alldata;
  login(parms,header,context) async {
    try {

      await ApiHandler.post(UrlResources.LOGIN,body: jsonEncode(parms),headers: header).then((json){

        if(json["result"]=="success")
          {
            islogin= true;

            //arry avvillible use map
     //       alldata = json.map<userdata>((obj)=>userdata.fromJson(obj)).toList();
            obj = userdata.fromJson(json["data"]);
            //arry not avvilible

          }

        else{
          islogin=false;
        }
      });


    }

    on ErrorHandler catch (ex)
    {
      if(ex.code.toString() == "500")
      {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>NoConcation())
        );
      }
    }
  }
}
