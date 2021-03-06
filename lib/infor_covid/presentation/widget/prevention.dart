import 'package:flutter/material.dart';

import '../../../constant.dart';

class PreventionWidget extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventionWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 8),
                //     blurRadius: 24,
                //     color: kShadowColor,
                //   ),
                // ],
              ),
            ),
            Image.asset(
              image,
              scale: 2,
            ),
            // SizedBox(
            //   width: 10,
            // ),
            Spacer(),
            Positioned(
              left: 140,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 140,
                width: MediaQuery.of(context).size.width - 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        //maxLines: 4,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: SvgPicture.asset("assets/icons/forward.svg"),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
