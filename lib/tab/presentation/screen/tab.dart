import 'package:covidapp/country/presentation/screen/covid_country_detail.dart';
import 'package:covidapp/home/presentation/screen/home.dart';
import 'package:covidapp/infor_covid/presentation/screen/information.dart';
import 'package:covidapp/readnews/presentation/screen/readnews.dart';
import 'package:flutter/material.dart';

class TabBarNavigation extends StatefulWidget {
  const TabBarNavigation({Key? key}) : super(key: key);

  @override
  _TabBarNavigationState createState() => _TabBarNavigationState();
}

class _TabBarNavigationState extends State {
  final GlobalKey _navKey = GlobalKey();
  var myindex = 0;
  var pagesAll = [
    HomeInfor(),
    CovidCountryDetail(),
    Information(),
    ReadNews(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // show lable
        backgroundColor: Colors.blue[50],
        key: _navKey,
        items: [
          BottomNavigationBarItem(
            icon: myindex == 0
                ? Image.asset('assets/images/tab1.png', color: Colors.green)
                : Image.asset(
                    'assets/images/tab1.png',
                  ),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: myindex == 1
                ? Image.asset('assets/images/worldwide.png',
                    color: Colors.green)
                : Image.asset(
                    'assets/images/worldwide.png',
                  ),
            label: "Đất nước",
          ),
          BottomNavigationBarItem(
            icon: myindex == 2
                ? Image.asset('assets/images/tab2.png', color: Colors.green)
                : Image.asset(
                    'assets/images/tab2.png',
                  ),
            label: "Thông tin",
          ),
          BottomNavigationBarItem(
            icon: myindex == 3
                ? Image.asset('assets/images/news.png', color: Colors.green)
                : Image.asset(
                    'assets/images/news.png',
                  ),
            label: "Thông tin",
          ),
        ],
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
      ),
      body: pagesAll[myindex],
    );
  }
}
