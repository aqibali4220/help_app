import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/textstyles.dart';
import '../../widgets/custom_clipper.dart';
import '../controllers/dashboard_controller.dart';

class HomeAlertsScreen extends StatelessWidget {
  HomeAlertsScreen({super.key});

  final DashboardController dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ClipPath(
              clipper: MyCustomClipper(clipType: ClipType.bottom),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: darkGreen,
                height: getHeight(250),
                width: getWidth(414),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(50),
                    ),
                    SizedBox(
                      width: 34,
                      child: RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Get.back();
                        },
                        shape: const CircleBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        child: const Icon(Icons.arrow_back_ios,
                            size: 15.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(50),
                    ),
                    Text(
                      "Home Alerts",
                      style: kSize24W500ColorWhite.copyWith(
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: getHeight(600),
                width: getWidth(414),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: getHeight(100),
                            width: getWidth(150),
                            decoration: BoxDecoration(
                              color: darkGreen.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Minor",
                                style: kSize14W500ColorBlack.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFont(18)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getWidth(15),
                          ),
                          Container(
                            height: getHeight(100),
                            width: getWidth(150),
                            decoration: BoxDecoration(
                              color: darkGreen.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Major",
                                style: kSize14W500ColorBlack.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFont(18)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        // height: getHeight(200),
                        width: getWidth(374),
                        decoration: BoxDecoration(
                          color: darkGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "History",
                              style: kSize14W500ColorBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFont(18)),
                            ),
                            Text(
                              ".",
                              style: kSize14W500ColorBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFont(18)),
                            ),
                            Text(
                              ".",
                              style: kSize14W500ColorBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFont(18)),
                            ),
                            Text(
                              ".",
                              style: kSize14W500ColorBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFont(18)),
                            ),
                            Text(
                              ".",
                              style: kSize14W500ColorBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFont(18)),
                            ),
                            Text(
                              ".",
                              style: kSize14W500ColorBlack.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getFont(18)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      Text(
                        "Care giver notified times",
                        style: kSize14W500ColorBlack.copyWith(
                            fontWeight: FontWeight.w700, fontSize: getFont(16)),
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "X",
                            style: kSize24W500ColorWhite.copyWith(
                                color: Colors.black),
                          ),
                          Text(
                            "times",
                            style: kSize14W500ColorBlack,
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: getHeight(100),
                        width: getWidth(374),
                        decoration: BoxDecoration(
                          color: darkGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Elderly altered by voice",
                            style: kSize14W500ColorBlack.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: getFont(18)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
