import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/LoginProvider.dart';

class ViewProduct extends StatefulWidget {


  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {



  var name="";
  var id="";
  LoginProvider provider;
  getdata() async
  {
 SharedPreferences prefs = await SharedPreferences.getInstance();
    // var userdata = prefs.getString("userdata");
    //
    // var json = jsonDecode(userdata);
    // print(json["id"]);
    // print(json["name"]);
    setState(() {
      name=prefs.getString("name");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider =Provider.of<LoginProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("viewProduct"),
        actions: [
          IconButton(onPressed: ()async{

            Navigator.of(context).pop();

          }, icon:Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Text(name),
          // Text(provider.obj.name)
        ],
      ),
    );
  }
}
