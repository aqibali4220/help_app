import 'package:help_app/utils/images.dart';
import 'package:help_app/utils/size_config.dart';
import 'package:help_app/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/colors.dart';
import '../../widgets/custom_password_textfeild.dart';
import '../../widgets/custom_textfield.dart';
import '../controllers/auth_controller.dart';
import 'login.dart';


class MyRegister extends StatelessWidget {
   MyRegister({Key? key}) : super(key: key);

   AuthController authController=Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(register_background), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();

        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 30),
                child: Text(
                  'register1'.tr,
                  style: kSize33ColorWhite,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(right: getWidth(35),left: getWidth(35),top: getHeight(240)),
                  child: Form(
                    key: authController.signupFormKey,
                    child: Column(
                      children: [
                        GetBuilder<AuthController>(builder: (context) {
                          return CustomTextField(
                            backgroundColor: white,
                            height: getHeight(60),
                            text: "Enter username",
                            length: 30,
                            controller: authController.nameController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                            authController.nameController.text.isNotEmpty
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            onChanged: (value) {
                              authController.update();
                            },
                            inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                            // FilteringTextInputFormatter.deny(RegExp('[ ]')),
                          );
                        }),
                        SizedBox(
                          height: getHeight(30),
                        ),
                        GetBuilder<AuthController>(builder: (context) {
                          return CustomTextField(
                            backgroundColor: white,
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
                            backgroundColor: white,
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
                              'register2'.tr,
                              style: kSize27W700ColorWhite,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: button_color,
                              child: IconButton(
                                  color: white,
                                  onPressed: () {
                                    if (authController.signupFormKey.currentState!
                                        .validate()) {
                                      authController.createUserFunc();
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
                                Get.offAll(()=>MyLogin());
                              },
                              child: Text(
                                'register3'.tr,
                                textAlign: TextAlign.left,
                                style: kSize18ColorWhite.copyWith(decoration: TextDecoration.underline),
                              ),
                            ),
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

