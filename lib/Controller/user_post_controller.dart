import 'package:flutter_application_task/Model/album_model.dart';
import 'package:flutter_application_task/Model/photo_model.dart';
import 'package:flutter_application_task/Model/user_post_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UserPostController extends GetxController {
  var userPost = <UserPostModel>[].obs;
  var loading = true.obs;

  Future getUserPost(int id) async {
    try {
      loading(true);
      var response = await RemoteService.fetchUserPost(id);
      if (response != null ){
        userPost.value = response;

      }

    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
    finally{
      loading(false);
    }
  }
 
}
