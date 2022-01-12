import 'dart:convert';
import 'package:covidapp/home/data/model/Country.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/home/data/model/country_summary.dart';
import 'package:covidapp/home/data/model/county.dart';

class CovidService {
  // Future<GlobalSummaryModel> getGlobalSummary() async {
  //   final data = await http.Client().get("https://api.covid19api.com/summary");

  //   if (data.statusCode != 200) throw Exception();

  //   GlobalSummaryModel summary =
  //       new GlobalSummaryModel.fromJson(json.decode(data.body));

  //   return summary;
  // }
  Future<List<CountrySummaryModel>> getCountrySummary(String slug) async {
    var url =
        Uri.parse('https://api.covid19api.com/total/dayone/country/' + slug);
    final data = await http.Client().get(url);

    if (data.statusCode != 200) throw Exception();

    List<CountrySummaryModel> summaryList = (json.decode(data.body) as List)
        .map((item) => CountrySummaryModel.fromJson(item))
        .toList();
    return summaryList;
  }

  // Future<List<CountryModelData>> getCountrySummary() async {
  //   var url = Uri.parse('https://corona.lmao.ninja/v2/countries');
  //   final data = await http.Client().get(url);

  //   if (data.statusCode != 200) throw Exception();

  //   List<CountryModelData> summaryList = (json.decode(data.body) as List)
  //       .map((item) => CountryModelData.fromJson(item))
  //       .toList();
  //   return summaryList;
  // }

  Future<List<CountryModel>> getCountryList() async {
    var url = Uri.parse('https://api.covid19api.com/countries');
    final data = await http.Client().get(url);

    if (data.statusCode != 200) throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List)
        .map((item) => CountryModel.fromJson(item))
        .toList();

    return countries;
  }
}
