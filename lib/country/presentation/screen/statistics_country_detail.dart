import 'package:covidapp/country/data/model/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constant.dart';

class StatisticsCovidCountry extends StatefulWidget {
  final CountryDetail summaryList;

  StatisticsCovidCountry({
    Key? key,
    required this.summaryList,
  }) : super(key: key);

  @override
  State<StatisticsCovidCountry> createState() => _StatisticsCovidCountryState();
}

class _StatisticsCovidCountryState extends State<StatisticsCovidCountry> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.summaryList.countries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 400),
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 70.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      widget.summaryList.countries[index]
                                          .countryCode,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                widget.summaryList.countries[index].country,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: kHeadingTextStyle.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          buildCardInfor(
                            widget.summaryList.countries[index].totalConfirmed,
                            kInfectedColor,
                            "Nhiễm bệnh",
                          ),
                          Spacer(),
                          buildCardInfor(
                            widget.summaryList.countries[index].totalDeaths,
                            kDeathColor,
                            "Tử vong",
                          ),
                        ],
                      ),
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: false,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ));
        },
      ),
    );
  }

  Widget buildCardInfor(int number, Color color, String title) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          NumberFormat.decimalPattern().format(number).toString(),
          style: TextStyle(
            fontSize: 32,
            color: color,
          ),
        ),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}
