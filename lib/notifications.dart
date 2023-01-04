import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notification_list/Utils/colors.dart';
import 'package:notification_list/app_text.dart';
import 'package:notification_list/home_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: AppText(
          text: 'Notifications',
          textSize: 17.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Obx(
        () => Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: controller.notificationList.length,
                itemBuilder: (_, index) {
                  bool isSameDate = true;
                  final String dateString = controller.notificationList[index].createdAt!;
                  final DateTime date = DateTime.parse(dateString);
                  final item = controller.notificationList[index];
                  if (index == 0) {
                    isSameDate = false;
                  } else {
                    final String prevDateString =
                        controller.notificationList[index - 1].createdAt!;
                    final DateTime prevDate = DateTime.parse(prevDateString);
                    isSameDate = date.isSameDate(prevDate);
                  }
                  if (index == 0 || !(isSameDate)) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                date.day == DateTime.now().day
                                    ? "Today"
                                    : date.day == DateTime.now().day - 1
                                        ? "Yesterday"
                                        : date.day == DateTime.now().day - 2
                                            ? "This week"
                                             : date.day == DateTime.now().day - 7
                                              ? "This month"
                                               : "${DateFormat('MMM dd, yyyy').format(DateTime.parse(item.createdAt!))}",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/notification.png",
                                    width: 40.w,
                                    height: 40.h,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: AppText(
                                            text: item.name!,
                                            lineHeight: 1.3,
                                            textSize: 12.sp,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            AppText(
                                              text: "10:19am",
                                              textSize: 10.sp,
                                              color: AppColors.blackColor
                                                  .withOpacity(0.33),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/notification.png",
                                width: 40.w,
                                height: 40.h,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: AppText(
                                        text: item.name!,
                                        lineHeight: 1.3,
                                        textSize: 12.sp,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AppText(
                                          text: "10:19am",
                                          textSize: 10.sp,
                                          color: AppColors.blackColor
                                              .withOpacity(0.33),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                })),
      ),
    );
  }
}

const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
