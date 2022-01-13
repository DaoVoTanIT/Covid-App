import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:covidapp/home/data/model/country_summary.dart';

import '../../../constant.dart';

class StatisticsCovidCountry extends StatefulWidget {
  final List<CountrySummaryModel> summaryList;

  StatisticsCovidCountry({
    Key? key,
    required this.summaryList,
  }) : super(key: key);

  @override
  State<StatisticsCovidCountry> createState() => _StatisticsCovidCountryState();
}

class _StatisticsCovidCountryState extends State<StatisticsCovidCountry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            color: kShadowColor,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildCardInfor(
            widget.summaryList[widget.summaryList.length - 1].confirmed,
            kInfectedColor,
            "Nhiễm bệnh",
          ),
          Spacer(),
          buildCardInfor(
            widget.summaryList[widget.summaryList.length - 1].death,
            kDeathColor,
            "Tử vong",
          ),
        ],
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

  Widget buildCard(String leftTitle, int leftValue, Color leftColor,
      String rightTitle, int rightValue, Color rightColor) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // Expanded(
                //   child: Container(),
                // ),
                Text(
                  leftValue.toString(),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                // Expanded(
                //   child: Container(),
                // ),
                // Text(
                //   "Total",
                //   style: TextStyle(
                //     color: rightColor,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 12,
                //   ),
                // ),
                Text(
                  rightValue.toString(),
                  style: TextStyle(
                    color: rightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
