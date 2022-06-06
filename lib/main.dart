import 'package:api_get_post/HomePage.dart';
import 'package:api_get_post/provider/LoginProvider.dart';
import 'package:api_get_post/provider/ShoppingProvider.dart';
import 'package:api_get_post/view/auth/LoginScreen.dart';
import 'package:api_get_post/view/auth/LoginWithProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginProvider()),

        ChangeNotifierProvider(create: (context)=>ShoppingProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LoginWithProvider(),
      ),
    );


  }
}
