import 'package:help_app/view/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/textstyles.dart';
import '../../widgets/custom_clipper.dart';

class PersonalSafetyScreen extends StatelessWidget {
   PersonalSafetyScreen({super.key});


   DashboardController dashboardController =Get.find();
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: darkGreen,
                height: getHeight(250),
                width: getWidth(414),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(50),),
                    SizedBox(
                      width: 34,
                      child: RawMaterialButton(
                        materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
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
                    SizedBox(height: getHeight(50),),

                    Text(
                      "Personal Safety",
                      style: kSize24W500ColorWhite.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
                height: getHeight(600),
                width: getWidth(414),
                child: ListView.separated(
                  itemCount: dashboardController.personalSafetyTextList.length,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  separatorBuilder: (context, index) => SizedBox(
                    height: getHeight(12),
                  ),
                  itemBuilder: (context, index) => Container(
                    height: getHeight(100),
                    width: getWidth(374),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkGreen.withOpacity(0.2)),
                    child: Center(child: Text("${dashboardController.personalSafetyTextList[index]}",style: kSize14W500ColorBlack.copyWith(fontSize: 16,fontWeight: FontWeight.w700),)),
                  ),

                )),
          ],
        ));
  }
}
