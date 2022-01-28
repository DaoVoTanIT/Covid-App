class CountryDetail {
  CountryDetail({
    required this.id,
    required this.message,
    required this.global,
    required this.countries,
    required this.date,
  });

  String id;
  String message;
  Global global;
  List<Country> countries;
  DateTime date;

  factory CountryDetail.fromJson(Map<String, dynamic> json) => CountryDetail(
        id: json["ID"],
        message: json["Message"],
        global: Global.fromJson(json["Global"]),
        countries: List<Country>.from(
            json["Countries"].map((x) => Country.fromJson(x))),
        date: DateTime.parse(json["Date"]),
      );
}

class Country {
  Country({
    required this.id,
    required this.country,
    required this.countryCode,
    required this.slug,
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
    required this.premium,
  });

  String id;
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;
  Premium premium;

  factory Country.fromJson(Map<String, dynamic> json) {
    String pathImage = json["CountryCode"];
    return Country(
      id: json["ID"],
      country: json["Country"],
      countryCode: 'assets/flags/' + pathImage.toLowerCase() + '.png',
      slug: json["Slug"],
      newConfirmed: json["NewConfirmed"],
      totalConfirmed: json["TotalConfirmed"],
      newDeaths: json["NewDeaths"],
      totalDeaths: json["TotalDeaths"],
      newRecovered: json["NewRecovered"],
      totalRecovered: json["TotalRecovered"],
      date: DateTime.parse(json["Date"]),
      premium: Premium.fromJson(json["Premium"]),
    );
  }
}

class Premium {
  Premium();

  factory Premium.fromJson(Map<String, dynamic> json) => Premium();

  Map<String, dynamic> toJson() => {};
}

class Global {
  Global({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
  });

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;

  factory Global.fromJson(Map<String, dynamic> json) => Global(
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecovered: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "NewConfirmed": newConfirmed,
        "TotalConfirmed": totalConfirmed,
        "NewDeaths": newDeaths,
        "TotalDeaths": totalDeaths,
        "NewRecovered": newRecovered,
        "TotalRecovered": totalRecovered,
        "Date": date.toIso8601String(),
      };
}
