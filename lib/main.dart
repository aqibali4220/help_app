import 'package:help_app/data/databindings.dart';
import 'package:help_app/utils/const.dart';
import 'package:help_app/utils/localization_page.dart';
import 'package:help_app/view/auth/view/login.dart';
import 'package:help_app/view/auth/view/register.dart';
import 'package:help_app/view/auth/view/splash_screen.dart';
import 'package:help_app/view/dashboard/view/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBindings();
  await Firebase.initializeApp(
    // optionas: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Hive.openBox(cElderlyBoxKey);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        title: 'Elderly App',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: "/", page: () =>  SplashScreen(),
            // binding: DataBinding()
          )
        ]);
  }
}
