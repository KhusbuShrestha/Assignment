import 'package:flutter_application_task/Model/photo_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';

class PhotoController extends GetxController {
  var photo = <PhotoModel>[].obs;
  var loading = true.obs;

  Future getPhoto(int id) async {
    try {
      loading(true);
      var response = await RemoteService.fetchPhoto(id);
      if (response != null ){
        photo.value = response;

      }

    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
    finally{
      loading(false);
    }
  }
}
