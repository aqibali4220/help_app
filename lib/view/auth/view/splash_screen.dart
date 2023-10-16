import 'dart:async';

import 'package:help_app/view/auth/controllers/auth_controller.dart';
import 'package:help_app/view/auth/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/images.dart';
import '../../../utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Get.find<AuthController>().checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          logo,
          width: getWidth(200),
          height: getHeight(200),
        ),
      ),
    );
  }
}
