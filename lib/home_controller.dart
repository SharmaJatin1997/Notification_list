import 'package:get/get.dart';
import 'package:notification_list/Utils/utils.dart';
import 'package:notification_list/api_data/api_provider/home_api_provider.dart';
import 'package:notification_list/api_data/shared/page_response.dart';
import 'package:notification_list/notification_model.dart';
class HomeController extends GetxController{
  late HomeApiProvider _homeApiProvider;
  RxList<NotificationModel> notificationList = RxList();

  @override
  void onInit() {
    _homeApiProvider=HomeApiProvider();
    getNotificationList();
    super.onInit();
  }

  Future getNotificationList() async {
    if (await Utils.hasNetwork()) {
      await Utils.showLoader();
      PageResponse response = await _homeApiProvider.getNotificationList();
      await Utils.hideLoader();
      if (response.success == false) {
        Utils.errorSnackBar(response.message);
      } else {
        if (response.body != null) {
          notificationList.clear();
          notificationList.value =response.body as List<NotificationModel>;
          notificationList.refresh();

        } else {
          return;
        }
      }
    }
  }
}