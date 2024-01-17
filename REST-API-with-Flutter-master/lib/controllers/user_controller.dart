import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../services/user_service.dart';

class HomeController extends GetxController {
  late UserService userService;
  List<UserModel> userDataList = [];
  bool isLoading = true;

  // onInit will called first when controller has been created
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userService = UserService();
    getUserData();
  }

  void getUserData() async {
    try {
      isLoading = true;
      http.Response response = await userService.getData();
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print(data);
        for (var userData in data) {
          userDataList.add(UserModel.fromJson(userData));
        }
        isLoading = false;
      }
      update();
    } catch (ex) {
      update();
      print(ex);
    }
  }
}
