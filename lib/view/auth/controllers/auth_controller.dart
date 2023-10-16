import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_app/data/general_controller.dart';
import 'package:help_app/utils/fiitbit_integration.dart';
import 'package:help_app/view/dashboard/view/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/const.dart';
import '../../widgets/custom_toasts.dart';
import '../../widgets/progress_bar.dart';
import '../view/login.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  createUserFunc() {
    Get.dialog(ProgressBar(), barrierDismissible: false);

    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Future.wait([
          addUserData(),
        ]);
        Get.find<GeneralController>().elderlyBox.put(cUserSession, true);

        Get.to(() => DashboardPage());
        nameController.clear();
        emailController.clear();
        locationController.clear();
        phoneController.clear();

        passwordController.clear();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomToast.failToast(msg: "sign7".tr);
      } else if (e.code == 'wrong-password') {
        CustomToast.failToast(msg: "sign8".tr);
      }
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  ///add user data to firebase
  Future addUserData() {
    return users.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'user_name': nameController.text,
      'email': emailController.text,
    }).then((value) {
      ///optional
    }).catchError(
        (error) => CustomToast.failToast(msg: "Failed to add user: $error"));
  }

  loginUserFunc() {
    Get.dialog(ProgressBar(), barrierDismissible: false);

    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        Get.find<GeneralController>().elderlyBox.put(cUserSession, true);
        Get.to(() => DashboardPage());

        emailController.clear();

        passwordController.clear();
      }, onError: (e) {
        Get.back();
        if (e.toString().contains("user-not-found")) {
          CustomToast.failToast(msg: "sign7".tr);
        }
        if (e.toString().contains("wrong-password")) {
          CustomToast.failToast(msg: "sign8".tr);
        }
        Get.log("aaaaaa $e");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomToast.failToast(msg: "sign7".tr);
      } else if (e.code == 'wrong-password') {
        CustomToast.failToast(msg: "sign8".tr);
      }
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  checkSession() async{
    if (Get.find<GeneralController>()
            .elderlyBox
            .get(cUserSession, defaultValue: false) ==
        true) {
      // await FitbitIntegration().fitbitAuth();

        Get.to(() => const DashboardPage());

    } else {
      Get.offAll(() => MyLogin());
    }
  }
}
