import 'dart:convert';
import 'package:covidapp/country/data/model/country_detail.dart';
import 'package:http/http.dart' as http;

class CovidServiceDetail {
  Future<CountryDetail> getGlobalSummary() async {
    var url = Uri.parse('https://api.covid19api.com/summary');
    final data = await http.Client().get(url);

    if (data.statusCode != 200) throw Exception();

    CountryDetail summary = CountryDetail.fromJson(json.decode(data.body));

    return summary;
  }
}
