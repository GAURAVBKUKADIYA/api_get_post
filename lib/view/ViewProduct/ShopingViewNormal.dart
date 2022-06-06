import 'dart:convert';

import 'package:api_get_post/model/Shoping.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../../resource/UrlResources.dart';

class ShopingViewNormal extends StatefulWidget {


  @override
  State<ShopingViewNormal> createState() => _ShopingViewNormalState();
}

class _ShopingViewNormalState extends State<ShopingViewNormal> {


  List<Shoping> data;

  getdata()async{

    Uri url = Uri.parse(UrlResources.SHOP);
    var response = await http.get(url);
    if(response.statusCode==200)
      {
        var body = response.body.toString();
        var json= jsonDecode(body);
        setState(() {
          data = json.map<Shoping>((obj)=>Shoping.fromJson(obj)).toList();
        });
      }
    else{

    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (data!=null)?ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return Container(
            child: Column(
              children: [
                Text(data[index].title.toString()),
                Text(data[index].category.toString()),
                Text(data[index].price.toString()),
                Image.network(data[index].image)              
              ],
            ),
          );
        },
      ):Center(child: CircularProgressIndicator(),)
    );
  }
}
