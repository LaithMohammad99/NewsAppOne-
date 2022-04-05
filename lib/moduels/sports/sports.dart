import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/component.dart';
import '../../provider/provider.dart';

class Sports extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Consumer<ProviderNews>(builder:(context,news,widget)=> ConditionalBuilder(
        condition: news.sports.isNotEmpty,
        builder:(context)=> ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: buildItems(context,news.sports[index]),
            ),
            separatorBuilder:(context,index)=> Divider(height: 4,color: Colors.blue.shade300),
            itemCount: news.sports.length),
        fallback:(context)=> Center(child: CupertinoActivityIndicator(),),
      ),
      )
      ,);
  }
}
