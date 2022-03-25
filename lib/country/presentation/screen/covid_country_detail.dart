import 'package:covidapp/country/data/model/country_detail.dart';
import 'package:covidapp/country/data/service/country_detail_service.dart';
import 'package:covidapp/country/presentation/screen/statistics_country_detail.dart';
import 'package:flutter/material.dart';

CovidServiceDetail covidServiceDetail = CovidServiceDetail();

class CovidCountryDetail extends StatefulWidget {
  const CovidCountryDetail({Key? key, summary}) : super(key: key);

  @override
  _CovidCountryDetailState createState() => _CovidCountryDetailState();
}

class _CovidCountryDetailState extends State<CovidCountryDetail> {
  Future<CountryDetail>? summaryGlobal;
  @override
  void initState() {
    // TODO: implement initState
    summaryGlobal = covidServiceDetail.getGlobalSummary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thống kê dịch Covid-19 các nước'),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    return !snapshot.hasData
                        ? Center(
                            child: Text("Empty"),
                          )
                        : StatisticsCovidCountry(
                            summaryList: snapshot.data,
                          );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
