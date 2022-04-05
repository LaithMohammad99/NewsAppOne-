import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/provider.dart';

import '../../component/component.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderNews>(
      builder: (context, news, widget) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  news.getSearch(value);
                },
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: Text('Search'),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search_rounded),
                    )),
              ),
              Expanded(
                  child: ConditionalBuilder(
                    condition: news.search.isNotEmpty,
                    builder:(context)=> ListView.separated(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: buildItems(context,news.search[index]),
                        ),
                        separatorBuilder:(context,index)=> Divider(height: 4,color: Colors.blue.shade300),
                        itemCount: news.search.length),
                    fallback:(context)=> Center(child: CupertinoActivityIndicator(),),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
