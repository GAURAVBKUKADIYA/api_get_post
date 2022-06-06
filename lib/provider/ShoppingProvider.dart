

import 'package:api_get_post/model/Shoping.dart';
import 'package:api_get_post/resource/UrlResources.dart';
import 'package:api_get_post/utility/ApiHandler.dart';
import 'package:api_get_post/utility/ErrorHandler.dart';
import 'package:api_get_post/utility/NoConcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingProvider extends ChangeNotifier{




  List<Shoping> allproducts;

  shopping(context)async{
    try{

      await ApiHandler.get(UrlResources.SHOP).then((json){
        allproducts = json.map<Shoping>((obj)=>Shoping.fromJson(obj)).toList();
        notifyListeners();
      });

    }
    on ErrorHandler catch (ex)
    {
      if(ex.code=="500")
        {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>NoConcation())
          );
        }
    }
  }

}