import 'package:covidapp/home/presentation/screen/home.dart';
import 'package:covidapp/infor_covid/presentation/screen/information.dart';
import 'package:flutter/material.dart';

class TabBarNavigation extends StatefulWidget {
  const TabBarNavigation({Key? key}) : super(key: key);

  @override
  _TabBarNavigationState createState() => _TabBarNavigationState();
}

class _TabBarNavigationState extends State {
  final GlobalKey _navKey = GlobalKey();

  var pagesAll = [
    HomeInfor(),
    Information(),
  ];

  var myindex = 0;

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
            //icon: Icon((myindex == 0) ? Icons.home_outlined : Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: myindex == 1
                ? Image.asset('assets/images/tab2.png', color: Colors.green)
                : Image.asset(
                    'assets/images/tab2.png',
                  ),
            //icon: Icon((myindex == 0) ? Icons.home_outlined : Icons.home),
            label: "Thông tin",
          ),

          // Icon((myindex == 0) ? Icons.home_outlined : Icons.home),
          // Icon((myindex == 1) ? Icons.map : Icons.map_outlined),
          // Icon((myindex == 2) ? Icons.add : Icons.add),
          // Icon((myindex == 3) ? Icons.favorite_border : Icons.favorite),
          // Icon((myindex == 4) ? Icons.people : Icons.people_alt)
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
