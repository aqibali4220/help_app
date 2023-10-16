
import 'package:help_app/view/auth/controllers/auth_controller.dart';
import 'package:help_app/view/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

import 'general_controller.dart';

Future DataBindings() async {


  /// Initializing Controllers
  Get.lazyPut(() => DashboardController(),fenix: true);
  Get.lazyPut(() => AuthController(),fenix: true);
  Get.lazyPut(() => GeneralController(),fenix: true);




}