import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/moduels/business/business.dart';
import 'package:untitled1/moduels/gems/games.dart';
import 'package:untitled1/moduels/serach/search.dart';
import 'package:untitled1/moduels/since/since.dart';
import 'package:untitled1/moduels/sports/sports.dart';

import '../dio.dart';

class ProviderNews with ChangeNotifier {
  int currentindex = 0;
  List<Widget> screens = [
    Business(),
    Sports(),
    Search(),
    Since(),
    Games(),
  ];

  void changePage(index) {
    currentindex = index;
    if(currentindex==1)
      Sport();
    if(currentindex==3)
      Science();
    if(currentindex==4)
      Entertainment();

    notifyListeners();
  }

  List<dynamic> businss = [];

  void Busniss() {
    notifyListeners();
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c',
    }).then((value) {
      businss = value.data['articles'];
      print(value.data['totalResults']);
      notifyListeners();

    }).catchError((onError) {
      print(onError);
      notifyListeners();

    });
  }
  List<dynamic> sports = [];

  void Sport() {
    notifyListeners();
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c',
    }).then((value) {
      sports = value.data['articles'];
      print(value.data['totalResults']);
      notifyListeners();

    }).catchError((onError) {
      print(onError);
      notifyListeners();

    });
  }

  List<dynamic> science = [];

  void Science() {
    notifyListeners();
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c',
    }).then((value) {
      science = value.data['articles'];
      print(value.data['totalResults']);
      notifyListeners();

    }).catchError((onError) {
      print(onError);
      notifyListeners();

    });
  }


  List<dynamic> entertainment = [];

  void Entertainment() {
    notifyListeners();
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c',
    }).then((value) {
      entertainment = value.data['articles'];
      print(value.data['totalResults']);
      notifyListeners();

    }).catchError((onError) {
      print(onError);
      notifyListeners();

    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {

    notifyListeners();
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'd1a73080a9ff415aa75ee46ec3bb142c',
    }).then((value) {
      search = value.data['articles'];
      notifyListeners();

    }).catchError((onError) {
      print(onError);
      notifyListeners();

    });
  }
}
