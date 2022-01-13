import 'package:covidapp/home/data/model/global.dart';
import 'package:covidapp/home/data/service/covid_service.dart';
import 'package:covidapp/home/presentation/screen/statistics_global.dart';
import 'package:covidapp/home/presentation/widget/gloabal_loading.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

CovidService covidService = CovidService();

class CovidGlobal extends StatefulWidget {
  const CovidGlobal({Key? key}) : super(key: key);

  @override
  _CovidGlobalState createState() => _CovidGlobalState();
}

class _CovidGlobalState extends State<CovidGlobal> {
  Future<GlobalSummaryModel>? summaryGlobal;
  @override
  void initState() {
    // TODO: implement initState
    summaryGlobal = covidService.getGlobalSummary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Thông tin Covid-19 trên toàn cầu",
                style: kTitleTextstyle,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    summaryGlobal = covidService.getGlobalSummary();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: summaryGlobal,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return GlobalLoading();
              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text("Empty"),
                      )
                    : GlobalStatistics(
                        summary: snapshot.data,
                      );
            }
          },
        ),
      ],
    );
  }
}
