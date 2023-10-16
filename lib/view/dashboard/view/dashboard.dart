import 'package:help_app/utils/colors.dart';
import 'package:help_app/utils/const.dart';
import 'package:help_app/utils/images.dart';
import 'package:help_app/utils/size_config.dart';
import 'package:help_app/utils/textstyles.dart';
import 'package:help_app/view/dashboard/controllers/dashboard_controller.dart';
import 'package:help_app/view/dashboard/view/daily_activities.dart';
import 'package:help_app/view/dashboard/view/health_monitor.dart';
import 'package:help_app/view/dashboard/view/home_alerts.dart';
import 'package:help_app/view/dashboard/view/home_protection.dart';
import 'package:help_app/view/dashboard/view/mental_health.dart';
import 'package:help_app/view/dashboard/view/personal_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/general_controller.dart';
import '../../auth/view/login.dart';
import '../../health_monitor_page.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_clipper.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageWidgetState createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    // For Grid Layout
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
            ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));
    SizeConfig().init(context);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-0.05, 0),
                child: Container(
                  width: 100,
                  height: 150,
                  decoration: const BoxDecoration(),
                  alignment:
                      const AlignmentDirectional(0, -0.09999999999999998),
                ),
              ),
              const ListTile(
                title: Text(
                  'Personal Safety',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              ListTile(
                title: const Text(
                  'Health Monitor',
                ),
                onTap: () {
                  Get.to(() => const HealthMonitorPage());
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: const Color(0xFFF5F5F5),
                dense: false,
              ),
              const ListTile(
                title: Text(
                  'Daily Activities',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              const ListTile(
                title: Text(
                  'Home Alerts',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              const ListTile(
                title: Text(
                  'Mental Health',
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
              const Spacer(),
              ListTile
                (
                title: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                                height: getHeight(225),
                                width: getWidth(374),
                                // padding: EdgeInsets.only(left: getWidth(12)),
                                decoration: BoxDecoration(
                                    color: white, borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Text(
                                      "subs5".tr,
                                      style: kSize24W500ColorWhite.copyWith(color:black),
                                    ),
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Text(
                                      "subs6".tr,
                                      style: kSize16W400ColorBlack,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: getHeight(36),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomButton(
                                          width: getWidth(145),
                                          text: "Cancel".tr,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          textColor: green,
                                          color: white,
                                          borderColor: green,
                                        ),
                                        CustomButton(
                                          width: getWidth(145),
                                          text: "Delete".tr,
                                          onPressed: () {
                                            // Get the current user.
                                            User? user = FirebaseAuth.instance.currentUser;

                                            // Check if the user is signed in.
                                            if (user != null) {
                                              // Delete the user's account.
                                              user.delete().then((_) {
                                                Get.offAll(()=>MyLogin());
                                                print('Account deleted');
                                              }).catchError((error) {
                                                print('Error deleting account: $error');
                                              });
                                            } else {
                                              print('User is not signed in');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getHeight(32),
                                    ),
                                  ],
                                )),
                          );
                        });

                  },
                  child: const Text(
                    'Delete Account',
                  ),
                ),
                trailing: const Icon(
                  Icons.logout,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: const Color(0xFFF5F5F5),
                dense: false,
              ),
              SizedBox(height: getHeight(20),),
              ListTile(
                title: InkWell(
                  onTap: () {
                    // Get.back();

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                                height: getHeight(225),
                                width: getWidth(374),
                                // padding: EdgeInsets.only(left: getWidth(12)),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Text(
                                      "subs7".tr,
                                      style: kSize24W500ColorWhite.copyWith(
                                          color: black),
                                    ),
                                    SizedBox(
                                      height: getHeight(20),
                                    ),
                                    Text(
                                      "subs8".tr,
                                      style: kSize16W400ColorBlack,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: getHeight(36),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomButton(
                                          width: getWidth(145),
                                          text: "Cancel".tr,
                                          onPressed: () {
                                            Get.back();
                                          },
                                          textColor: green,
                                          color: white,
                                          borderColor: green,
                                        ),
                                        CustomButton(
                                          width: getWidth(145),
                                          text: "Logout".tr,
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Get.find<GeneralController>()
                                                .elderlyBox
                                                .put(cUserSession, false);

                                            Get.offAll(
                                              () => MyLogin(),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: getHeight(32),
                                    ),
                                  ],
                                )),
                          );
                        });

                    if (kDebugMode) {
                      Get.log("Log me out");
                    }
                  },
                  child: const Text(
                    'Logout',
                  ),
                ),
                trailing: const Icon(
                  Icons.logout,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: const Color(0xFFF5F5F5),
                dense: false,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: darkGreen,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          // title: const Text(
          //   'Care Giver DashBoard',
          //   style: TextStyle(
          //     fontFamily: 'Poppins',
          //     color: Colors.white,
          //     fontSize: 22,
          //   ),
          // ),
          centerTitle: false,
          elevation: 0,
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: MyCustomClipper(clipType: ClipType.bottom),
              child: Container(
                color: darkGreen,
                height: getHeight(250),
              ),
            ),
            const Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Care Giver Dashboard",
                  style: kSize24W500ColorWhite,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: getHeight(700),
                width: getWidth(414),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    crossAxisSpacing: _crossAxisSpacing,
                    mainAxisSpacing: _mainAxisSpacing,
                    childAspectRatio: _aspectRatio,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => PersonalSafetyScreen());
                            break;
                          case 1:
                            Get.to(() => HealthMonitorScreen());
                            break;
                          case 2:
                            Get.to(() => DailyActivitiesScreen());
                            break;
                          case 3:
                            Get.to(() => HomeAlertsScreen());
                            break;
                          case 4:
                            Get.to(() => MentalHealthScreen());
                            break;
                          case 5:
                            Get.to(() => HomeProtectionScreen());
                            break;
                        }
                      },
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: getHeight(150),
                          width: getWidth(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                dashboardController.dashBoardImageList[index],
                                height: getHeight(70),
                                width: getWidth(70),
                              ),
                              SizedBox(
                                height: getHeight(12),
                              ),
                              Text(
                                "${dashboardController.dashBoardTextList[index]}",
                                style: kSize14W500ColorBlack,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
