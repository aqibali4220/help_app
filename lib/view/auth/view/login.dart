import 'package:help_app/utils/images.dart';
import 'package:help_app/utils/size_config.dart';
import 'package:help_app/utils/textstyles.dart';
import 'package:help_app/view/auth/view/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/colors.dart';
import '../../dashboard/view/dashboard.dart';
import '../../../main.dart';
import '../../widgets/custom_password_textfeild.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/auth_controller.dart';

class MyLogin extends StatelessWidget {
   MyLogin({Key? key}) : super(key: key);


   AuthController authController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(login_background), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();

        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'login1'.tr,
                  style: kSize33ColorWhite,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(right: getWidth(35),left: getWidth(35),top: getHeight(350)),

                  child: Form(
                    key: authController.loginFormKey,
                    child: Column(
                      children: [
                        GetBuilder<AuthController>(builder: (context) {
                          return CustomTextField(
                            // backgroundColor: grey,
                            height: getHeight(60),
                            text: "Enter email",
                            length: 30,
                            controller: authController.emailController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                            authController.emailController.text.isNotEmpty
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            onChanged: (value) {
                              authController.update();
                            },
                            inputFormatters:
                            FilteringTextInputFormatter.deny(RegExp('[ ]')),
                          );
                        }),
                        SizedBox(
                          height: getHeight(30),
                        ),
                        GetBuilder<AuthController>(builder: (context) {
                          return CustomPasswordTextField(
                            // backgroundColor: white,
                            height: getHeight(60),
                            text: "********",
                            obscureText: true,
                            sufficon: 1,
                            length: 30,
                            controller: authController.passwordController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                            authController.passwordController.text.isNotEmpty
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            onChanged: (value) {
                              authController.update();
                            },
                            inputFormatters:
                            FilteringTextInputFormatter.deny(RegExp('[ ]')),
                          );
                        }),
                        SizedBox(
                          height: getHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'register3'.tr,
                              style: kSize27W700ColorWhite.copyWith(color: black),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: button_color,
                              child: IconButton(
                                  color: white,
                                  onPressed: () {

                                    if (authController.loginFormKey.currentState!
                                        .validate()) {
                                      authController.loginUserFunc();
                                    }

                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                               Get.offAll(()=>MyRegister());
                              },
                              child: Text(
                                'register2'.tr,
                                textAlign: TextAlign.left,
                                style: kSize18ColorWhite.copyWith(decoration: TextDecoration.underline,color: black),
                              ),

                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'login2'.tr,
                                  style: kSize18ColorWhite.copyWith(decoration: TextDecoration.underline,color: black),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
