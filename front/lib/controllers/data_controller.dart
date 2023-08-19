import 'package:front/services/service.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];

  List<dynamic> get myData => _myData;

  Future<void> getData() async {
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("data was received");
      update();
    } else {
      print("no data was received");
    }
  }
}
