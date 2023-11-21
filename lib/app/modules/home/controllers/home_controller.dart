import 'package:get/get.dart';
import 'package:my_first_get_x/app/data/get_user_data.dart';
import 'package:my_first_get_x/app/models/user_entity.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  UserModel? userData;

  Stream<List<UserModel>> getData() async* {
    List<UserModel> data = [];
    final apiService = GetUserDataService();
    var response = await apiService.getData();
    for (var element in response) {
      data.add(UserModel.fromJson(element));
    }
    yield data;
  }

// GetUserDataService.deleteData();
  // update();
  Future deleteData(int index) async {
    final apiService = GetUserDataService();
    var response = await apiService.deleteData(index);
    update();

    return response;
  }

  Future updateData(int index) async {
    final apiService = GetUserDataService();
    var response = await apiService.updateData(index);
    update();

    return response;
  }

Future addData() async {
    final apiService = GetUserDataService();
    var response = await apiService.addData();
    update();

    return response;
  }
  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
