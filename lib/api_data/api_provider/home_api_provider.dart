import 'package:dio/dio.dart';
import 'package:notification_list/api_data/Injector.dart';
import 'package:notification_list/api_data/api_provider/api_constants.dart';
import 'package:notification_list/api_data/shared/error_model.dart';
import 'package:notification_list/api_data/shared/page_response.dart';
import 'package:notification_list/notification_model.dart';

class HomeApiProvider{
  late Dio _dio;

  HomeApiProvider(){
    _dio = Injector().getDio();
  }

  Future<dynamic> getNotificationList() async{
    try{
      Response response = await _dio.get(ApiConstants.notification,options: Injector.getHeaderToken());
      var dataResponse = PageResponse<NotificationModel>.fromJson(response.data, (data) =>
          NotificationModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    }
    catch(error){
      final res = (error as dynamic).response;
      if(res!=null) {
        return ErrorModel.fromJson(res?.data,(data) =>
            NotificationModel.fromJson(data as Map<String, dynamic>));
      }
      return ErrorModel(message: error.toString());
    }

  }
}