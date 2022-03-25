import 'package:flutter/material.dart';

import 'package:covidapp/infor_covid/data/domain/asked_question_covid.dart';

import '../../../constant.dart';

// class AskedCovid extends StatelessWidget {
//   final AskQuestionCovid askQuestionCovid;
//   AskedCovid({
//     Key? key,
//     required this.askQuestionCovid,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanel(
//       headerBuilder: (BuildContext context, bool isExpanded) {
//       return ListTile(
//         title: Text(askQuestionCovid.asked),
//       );
//     },
//      body: ListTile(
//       title: Text(askQuestionCovid.question),
//     ),
//     );
//   }
// }

class FAQPage extends StatefulWidget {
  FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ExpansionPanelList(
            animationDuration: Duration(milliseconds: 400),
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            DataSource.questionAnswers[index]["question"],
                            overflow: TextOverflow.fade,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DataSource.questionAnswers[index]["answer"],
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
          );
        });
  }
}
