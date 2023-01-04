import 'package:flutter/services.dart';

class AppColors {
  AppColors._();

  static const Color greyColor = Color(0xffC4C4C4);
  static const Color greenColor = Color(0xff3DCC00);
  static const Color boldGrey = Color(0xff707070);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color trans = Color(0x000000);
  static const Color otpFieldColor = Color(0xffEBEBEB);
  static const Color editTextColor = Color(0xffF2F2F2);
  static Color grey = Color(0xffF2F2F2).withOpacity(0.3);

  static SystemUiOverlayStyle mySystemTheme = const SystemUiOverlayStyle(
    statusBarColor: greyColor,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  );
}
