import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notification_list/Utils/colors.dart';
import 'package:notification_list/notifications.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return GetMaterialApp(
              builder: EasyLoading.init(builder: (BuildContext? context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context!);
                final scale = data.textScaleFactor.clamp(1.0, 1.3);
                return MediaQuery(
                  data: data.copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              }),
              theme: ThemeData(
                fontFamily: "OpenSans",
                primarySwatch: Colors.grey,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  color: AppColors.whiteColor,
                  foregroundColor: Colors.black,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    //<-- SEE HERE
                    // Status bar color
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                bannerTheme: const MaterialBannerThemeData(backgroundColor: Colors.red),
              ),
              debugShowCheckedModeBanner: false,
              home: NotificationScreen(),
            );
          });

    return GetMaterialApp(
      builder:
      EasyLoading.init(builder: (BuildContext? context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context!);
        final scale = data.textScaleFactor.clamp(1.0, 1.3);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      }),
      theme: ThemeData(),
      home: NotificationScreen(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.blueAccent
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

