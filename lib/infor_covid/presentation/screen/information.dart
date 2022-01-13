import 'package:covidapp/home/presentation/widget/header_widget.dart';
import 'package:covidapp/infor_covid/presentation/widget/prevention.dart';
import 'package:covidapp/infor_covid/presentation/widget/symptom.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              image: "assets/icons/coronadr.svg",
              textTop: "Thông tin về",
              textBottom: "DỊCH COVID-19",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Triệu chứng",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SymptomWidget(
                          image: "assets/images/headache.png",
                          title: "Đau đầu",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SymptomWidget(
                          image: "assets/images/high_fever.png",
                          title: "Sốt cao",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SymptomWidget(
                          image: "assets/images/cough.png",
                          title: "Ho",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SymptomWidget(
                          image: "assets/images/sore_throat.png",
                          title: "Đau họng",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Triệu chứng",
            //         style: kTitleTextstyle,
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //       SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Row(
            //           children: [
            //             PreventionWidget(
            //                 image: "assets/images/wash_hands.png",
            //                 title:
            //                     "Rửa tay thường xuyên bằng xà phòng hoặc dung dịch sát khuẩn",
            //                 text:
            //                     "Rửa tay thường xuyên bằng xà phòng hoặc dung dịch sát khuẩn tay."),
            //             PreventionWidget(
            //                 image: "assets/images/face_mask.png",
            //                 title: " khẩu trang ở nơi đông người",
            //                 text: "Rửa tay kĩ"),
            //             PreventionWidget(
            //                 image: "assets/images/avoid_contact.png",
            //                 title: "Giữ khoảng cách, hạn chế tiếp xúc",
            //                 text: "Rửa tay kĩ"),
            //             PreventionWidget(
            //                 image: "assets/images/cover_cough.png",
            //                 title: "Không đưa tay lên mặt",
            //                 text: "Rửa tay kĩ"),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Text("Prevention", style: kTitleTextstyle),
            PreventionWidget(
                image: "assets/images/wash_hands.png",
                title: "Rửa tay",
                text:
                    "Rửa tay thường xuyên bằng xà phòng hoặc dung dịch sát khuẩn tay."),
            PreventionWidget(
                image: "assets/images/face_mask.png",
                title: "khẩu trang",
                text: "Rửa tay kĩ"),
            PreventionWidget(
                image: "assets/images/avoid_contact.png",
                title: "Khoảng cách",
                text: "Rửa tay kĩ"),
            PreventionWidget(
                image: "assets/images/cover_cough.png",
                title: "Không đưa tay lên mặt",
                text: "Rửa tay kĩ"),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
