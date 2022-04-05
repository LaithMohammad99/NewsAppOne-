import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/provider.dart';

import '../../component/component.dart';

class Business extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        body: Consumer<ProviderNews>(builder:(context,news,widget)=> ConditionalBuilder(
          condition: news.businss.isNotEmpty,
          builder:(context)=> ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildItems(context,news.businss[index]),
              ),
              separatorBuilder:(context,index)=> Divider(height: 4,color: Colors.blue.shade300),
              itemCount: news.businss.length),
        fallback:(context)=> Center(child: CupertinoActivityIndicator(),),
        ),
      )
        ,);



  }
}

// ConditionalBuilder(
// condition:data.businss.isNotEmpty ,
// builder:(context)=> ListView.separated(
// separatorBuilder: (context, index) => Divider(height: 4,color: Colors.blue.shade300,),
// itemBuilder: (context, index) => Padding(
// padding: const EdgeInsets.all(8.0),
// child: buildItems(context,data.businss[index]),
// ),
// itemCount:10),
// fallback: (context)=>Center(),   )
