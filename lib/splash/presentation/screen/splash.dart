import 'package:covidapp/tab/presentation/screen/tab.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _buildHeader(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Image.asset("assets/images/virus_2.png"),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .25,
              right: 25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Image.asset("assets/images/person.png"),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "Nothing in life is to be feared, it is only to be understood.\n",
            //   style: TextStyle(
            //     fontSize: 24,
            //     color: Colors.deepPurple,
            //     height: 1.5,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TabBarNavigation(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * .85,
                height: 60,
                child: Center(
                  child: Text(
                    "Bỏ qua",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Circular',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
