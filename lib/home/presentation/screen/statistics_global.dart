import 'package:covidapp/home/data/model/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../constant.dart';

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");

  GlobalStatistics({Key? key, required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildCard(
          "Nhiễm bệnh",
          summary.totalConfirmed,
          summary.newConfirmed,
          kInfectedColor,
        ),
        SizedBox(
          height: 20,
        ),
        buildCard(
            "Tử vong", summary.totalDeaths, summary.newDeaths, kDeathColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "Cập nhật lúc: ${dateFormat.format(summary.date)}",
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Tổng", style: kSubTextStyle),
                    Text(
                      NumberFormat.decimalPattern()
                          .format(totalCount)
                          .toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Hôm nay", style: kSubTextStyle),
                    Text(
                      NumberFormat.decimalPattern()
                          .format(todayCount)
                          .toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
