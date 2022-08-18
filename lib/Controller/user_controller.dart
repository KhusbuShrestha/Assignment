import 'package:flutter_application_task/Model/album_model.dart';
import 'package:flutter_application_task/Model/photo_model.dart';
import 'package:flutter_application_task/Model/user_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = <UserModel>[].obs;
  var loading = true.obs;

  Future getUser() async {
    try {
      loading(true);
      var response = await RemoteService.fetchUser();
      if (response != null ){
        user.value = response;

      }

    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
    finally{
      loading(false);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }
  
}
