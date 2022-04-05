
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/moduels/webView/webview.dart';

Widget buildItems(context,list) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(list['url'],)));
  },
  child:   Column(
  
        children: [
  
          Row(
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Container(
  
                width: 130,
  
                height: 130,
  
                decoration: BoxDecoration(
  
                  borderRadius: BorderRadius.circular(20),
  
                  image: DecorationImage(
  
                      image: NetworkImage(
  
                          '${list['urlToImage']}'),
  
                      fit: BoxFit.cover),
  
                ),
  
              ),
  
              SizedBox(
  
                width: 20,
  
              ),
  
              Expanded(
  
                child: Container(
  
                  height: 120,
  
                  child: Column(
  
                    mainAxisSize: MainAxisSize.min,
  
                    crossAxisAlignment: CrossAxisAlignment.start,
  
                    children: [
  
                      Expanded(
  
                        child: Text(
  
                          '${list['title']}',
  
                          style: Theme.of(context).textTheme.bodyText1,
  
                          maxLines: 5,
  
                          overflow: TextOverflow.ellipsis,
  
                        ),
  
                      ),
  
                      Text(
  
                        '${list['publishedAt']}',
  
                        style: TextStyle(color: Colors.grey.shade400),
  
                      ),
  
                    ],
  
                  ),
  
                ),
  
              ),
  
            ],
  
          ),
  
        ],
  
      ),
);


Widget CarouselSliderForMe()=>
    CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [1,2,3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: Image.network(
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),);
          },
        );}).toList(),
    );

