import 'dart:convert';
import 'package:covidapp/home/data/model/global.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/home/data/model/country_summary.dart';
import 'package:covidapp/home/data/model/country.dart';

class CovidService {
  Future<GlobalSummaryModel> getGlobalSummary() async {
    var url = Uri.parse('https://api.covid19api.com/summary');
    final data = await http.Client().get(url);

    if (data.statusCode != 200) throw Exception();

    GlobalSummaryModel summary =
        GlobalSummaryModel.fromJson(json.decode(data.body));

    return summary;
  }

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
