import 'package:covidapp/home/presentation/widget/header_widget.dart';
import 'package:covidapp/infor_covid/presentation/widget/askaboutcovid.dart';
import 'package:covidapp/infor_covid/presentation/widget/prevention.dart';
import 'package:covidapp/infor_covid/presentation/widget/symptom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final controller = ScrollController();
  double offset = 0;
  final numberBYT = '19009095';

  @override
  void initState() {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.phone),
          onPressed: () async {
            // setState(() {
            //   _makePhoneCall('tel:0597924917');
            // });
            launch('tel://$numberBYT');
          },
        ),
      ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Phòng ngừa",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Quy tắc 5k(Bộ y tế)",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  PreventionWidget(
                      image: "assets/images/face_mask.png",
                      title: "khẩu trang",
                      text:
                          "Rửa tay thường xuyên bằng xà phòng hoặc dung dịch sát khuẩn tay. Vệ sinh các bề mặt/ vật dụng thường xuyên tiếp xúc."),
                  PreventionWidget(
                      image: "assets/images/wash_hands.png",
                      title: "Khử khuẩn",
                      text:
                          "Đeo khẩu trang vải thường xuyên tại nơi công cộng, nơi tập trung đông người; đeo khẩu trang y tế tại các cơ sở y tế, khu cách ly."),
                  PreventionWidget(
                      image: "assets/images/avoid_contact.png",
                      title: "Khoảng cách",
                      text: "Giữ khoảng cách khi tiếp xúc với người khác."),
                  PreventionWidget(
                      image: "assets/images/cover_cough.png",
                      title: "Không đưa tay lên mặt",
                      text:
                          "Khai báo y tế trên App NCOVI; cài đặt ứng dụng BlueZone tại địa chỉ https://www.bluezone.gov.vn để được cảnh báo nguy cơ lây nhiễm COVID-19."),
                ],
              ),
            ),
            FAQPage()
          ],
        ),
      ),
    );
  }
}
