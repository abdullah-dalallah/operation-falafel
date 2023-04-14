import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset("assets/images/loading_page.gif", height: 45,width: 45,fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),
          Text("Loading...", style: TextStyle(color: Colors.white, ),textAlign: TextAlign.center,)
        ],
      ),
    );
  }

}