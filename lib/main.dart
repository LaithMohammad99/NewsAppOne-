import 'package:flutter/material.dart';
import 'package:untitled1/dio.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/moduels/business/business.dart';
import 'package:untitled1/provider/provider.dart';
import 'layout/layout.dart';

void main() {
  DioHelper.init();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ProviderNews()..Busniss(),
      child: MaterialApp(
        home: LayOutPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class LayOutPage extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerNews = Provider.of<ProviderNews>(context);
    int index = 0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News Cloud',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 30,
          ),
          Icon(Icons.sports_baseball_outlined, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.science_outlined, size: 30),
          Icon(Icons.games, size: 30),
        ],
        onTap: (index) {
          providerNews.changePage(index);
          //Handle button tap
        },
        index: index,
        color: Colors.blue.shade300,
        animationCurve: Curves.fastOutSlowIn,
      ),
      body: providerNews.screens[providerNews.currentindex],
    );
  }
}
