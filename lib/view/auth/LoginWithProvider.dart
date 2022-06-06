import 'package:api_get_post/provider/LoginProvider.dart';
import 'package:api_get_post/resource/StyaleResources.dart';
import 'package:api_get_post/view/ViewProduct/ShoppingViewProvider.dart';
import 'package:api_get_post/view/ViewProduct/ViewProduct.dart';
import 'package:api_get_post/widgets/MyPrimaryButton.dart';
import 'package:api_get_post/widgets/MyTextBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ViewProduct/ShopingViewNormal.dart';

class LoginWithProvider extends StatefulWidget {


  @override
  State<LoginWithProvider> createState() => _LoginWithProviderState();
}

class _LoginWithProviderState extends State<LoginWithProvider> {

  TextEditingController _name = TextEditingController();
  TextEditingController _pass = TextEditingController();

LoginProvider provider;



  Widget _loginform()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name",style:StyaleResources.primaryTextstyle,),
        SizedBox(height: 10,),
        MyTextBox(
          controller: _name,
          ispassword: false,
          hinttext: "loginname",
          keyboard: TextInputType.text,
        ),
        SizedBox(height: 10,),
        Text("Password",style:StyaleResources.primaryTextstyle,),
        SizedBox(height: 10,),
        MyTextBox(
          controller: _pass,
          ispassword: false,
          hinttext: "password123",
          keyboard: TextInputType.number,
        ),
      ],
    );
  }


  Widget _submit(){
    return MyPrimaryButton(
      onclick: ()async{
        var name = _name.text.toString();
        var pass = _pass.text.toString();

        Map<String,String> parms = {
          "name": name,
          "password": pass,
          "device_token":"12345678",
          "device_os":"android"
        };
        Map<String,String> header = {
          "Content-Type": "application/json",
        };

        await provider.login(parms, header,context);
        if(provider.islogin)
          {
            Fluttertoast.showToast(
                msg: "LoginSucsessFuly",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("name", provider.obj.name.toString());

            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>ShopingViewNormal())
            );

          }
        else{
          Fluttertoast.showToast(
              msg: "SomthingWrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          _name.text="";
          _pass.text="";
        }

      },
      buttonText: "Login",
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    provider =Provider.of<LoginProvider>(context,listen: false);
    _name.text="dipak";
    _pass.text="123456";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScrren"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _loginform(),
              SizedBox(height: 20,),
              _submit(),
            ],
          ),
        ),

      ),
    );
  }
}
