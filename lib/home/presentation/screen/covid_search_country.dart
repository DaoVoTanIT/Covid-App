import 'package:covidapp/home/data/model/country_summary.dart';
import 'package:covidapp/home/data/model/country.dart';
import 'package:covidapp/home/data/service/covid_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'statistics_country.dart';

CovidService covidService = CovidService();

class InforCovid extends StatefulWidget {
  const InforCovid({Key? key}) : super(key: key);

  @override
  _InforCovidState createState() => _InforCovidState();
}

class _InforCovidState extends State<InforCovid> {
  final TextEditingController _typeAheadController = TextEditingController();
  Future<List<CountryModel>>? countryList;
  Future<List<CountrySummaryModel>>? summaryList;
  @override
  initState() {
    super.initState();

    countryList = covidService.getCountryList();

    _typeAheadController.text = "Viet nam";
    summaryList = covidService.getCountrySummary("Viet nam");
  }

  List<String> _getSuggestions(List<CountryModel> list, String query) {
    List<String> matches = [];

    for (var item in list) {
      matches.add(item.country);
    }

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                    child: Text('Empty'),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _typeAheadController,
                          decoration: InputDecoration(
                            hintText: 'Tên quốc gia',
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(20),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 24.0, right: 16.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          return _getSuggestions(snapshot.data, pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text('${suggestion}'),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          _typeAheadController.text = suggestion as String;
                          setState(() {
                            summaryList = covidService.getCountrySummary(
                                snapshot.data
                                    .firstWhere((element) =>
                                        element.country == suggestion)
                                    .slug);
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      FutureBuilder(
                          future: summaryList,
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
                                        summaryList: snapshot.data);
                            }
                          })
                    ],
                  );
        }
      },
    );
  }
}
