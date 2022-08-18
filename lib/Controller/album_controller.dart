import 'package:flutter_application_task/Model/album_model.dart';
import 'package:flutter_application_task/Model/photo_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AlbumController extends GetxController {
  var album = <AlbumModel>[].obs;
  var loading = true.obs;

  Future getalbum(int id) async {
    try {
      loading(true);
      var response = await RemoteService.fetchAlbum(id);
      if (response != null ){
        album.value = response;

      }

    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
    finally{
      loading(false);
    }
  }
 
}
