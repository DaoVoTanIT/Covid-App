import 'package:covidapp/home/data/model/county.dart';
import 'package:covidapp/home/data/service/covid_service.dart';
import 'package:covidapp/home/presentation/screen/search.dart';
import 'package:covidapp/home/presentation/widget/header_widget.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';

CovidService covidService = CovidService();

class HomeInfor extends StatefulWidget {
  const HomeInfor({Key? key}) : super(key: key);

  @override
  _HomeInforState createState() => _HomeInforState();
}

class _HomeInforState extends State<HomeInfor> {
  final controller = ScrollController();
  double offset = 0;
  late Future<List<CountryModel>> countryList;
  //final List<CountrySummaryModel>? summaryList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryList = covidService.getCountryList();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            HeaderWidget(
              image: "assets/icons/Drcorona.svg",
              textTop: "Ở nhà là",
              textBottom: "YÊU NƯỚC",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Thông tin dịch bệnh",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Xem chi tiết",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  InforCovid(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Biểu đồ tổng số ca mắc covid-19",
                        style: kTitleTextstyle,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
