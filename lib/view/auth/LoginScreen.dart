import 'dart:convert';

import 'package:api_get_post/resource/StyaleResources.dart';
import 'package:api_get_post/widgets/MyPrimaryButton.dart';
import 'package:api_get_post/widgets/MyTextBox.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../resource/UrlResources.dart';
import '../ViewProduct/ViewProduct.dart';
import '../Viewproduct.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _pass = TextEditingController();




  Widget _loginform(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name",style: StyaleResources.primaryTextstyle,),
        SizedBox(height: 10,),
        MyTextBox(
          hinttext: "entere your name",
          ispassword: false,
          controller: _name,
        ),
        SizedBox(height: 10,),
        Text("Password",style:StyaleResources.primaryTextstyle,),
        SizedBox(height: 10,),
        MyTextBox(
          hinttext: "password",
          ispassword: true,
          controller: _pass,
        )
      ],
    );
  }
  Widget _loginclick()
  {
    return MyPrimaryButton(
      buttonText: "Login",
      onclick: ()async{


        //normal call api
        Uri url = Uri.parse(UrlResources.LOGIN);
        Map<String,String>parms={
          "name": "dipak",
          "password": "123456",
          "device_token":"12345678",
          "device_os":"android"
        };
        var heder = {
          "Content-Type":"application/json"
        };
        var response = await http.post(url,body: jsonEncode(parms),headers: heder);
        if(response.statusCode==200)
          {
            var json = jsonDecode(response.body);
            if(json["result"]=="success")
              {
                Fluttertoast.showToast(
                    msg: "Successfully Login",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);


                SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.setString("id", json["data"]["id"]);
                // prefs.setString("name", json["data"]["name"]);
                // prefs.setString("email", json["data"]["email"]);



               // prefs.setString("userdata", jsonEncode(json["data"]));



                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ViewProduct())
                );
              }
            else{
              Fluttertoast.showToast(
                  msg: "Successfully Login",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }



      },
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name.text="dipak";
    _pass.text="123456";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child:Column(
            children: [
              _loginform(),
              SizedBox(height: 20,),
              _loginclick()

            ],
          ),
        ),
      ),
    );
  }
}
