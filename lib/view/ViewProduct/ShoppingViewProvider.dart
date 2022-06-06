import 'package:api_get_post/provider/ShoppingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/Shoping.dart';

class ShoppingView extends StatefulWidget {


  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {



  ShoppingProvider provider;

  getdata()async{
    await provider.shopping(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider =Provider.of<ShoppingProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider =Provider.of<ShoppingProvider>(context,listen: true);
    return Scaffold(
      body: (provider.allproducts!=null)?SafeArea(
        child: ListView.builder(
          itemCount: provider.allproducts.length,
          itemBuilder: (context,index){
            return Container(
              child: Column(
                children: [
                  Text(provider.allproducts[index].title.toString())
                ],
              ),
            );
          },
        ),
      ):Center(child: CircularProgressIndicator(),)
    );
  }
}
