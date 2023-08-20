import 'dart:developer';

import 'package:front/services/service.dart';
import 'package:front/utils/app_constants.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];

  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.getTasks);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("data was received");
      update();
    } else {
      print("no data was received");
    }
    _isLoading = false;
  }

  Future<void> getTask(final String id) async {
    _isLoading = true;
    Response response = await service.getData('${AppConstants.getTask}/$id');
    if (response.statusCode == 200) {
      _singleData = response.body;
      log(_singleData.toString());
      update();
      print("task was received");
    } else {
      print("no task was received");
    }
    _isLoading = false;
  }

  Future<void> postData(String name, String detail) async {
    _isLoading = true;

    Response response = await service.postData(
      AppConstants.postTask,
      {
        "name": name,
        "detail": detail,
      },
    );
    if (response.statusCode == 200) {
      update();
      log("data was posted successfully");
    } else {
      log("no data was posted");
    }
    _isLoading = false;
  }

  Future<void> updateData(String name, String detail, String id) async {
    _isLoading = true;

    Response response = await service.updateData(
      "${AppConstants.updateTask}/$id",
      {
        "name": name,
        "detail": detail,
      },
    );
    if (response.statusCode == 200) {
      update();
      log("data was updated successfully");
    } else {
      log("no data was updated");
    }
    _isLoading = false;
  }

  Future<void> deleteData(String id) async {
    _isLoading = true;

    Response response = await service.deleteData(
      "${AppConstants.deleteTask}/?id=$id"
    );
    if (response.statusCode == 200) {
      update();
      log("data was deleted successfully");
    } else {
      log("no data was deleted");
    }
    _isLoading = false;
  }
}
