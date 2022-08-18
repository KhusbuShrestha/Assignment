import 'package:flutter_application_task/Model/photo_model.dart';
import 'package:flutter_application_task/Model/todos_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';

class ToDosController extends GetxController {
  var todos = <ToDosModel>[].obs;
  var loading = true.obs;

  Future getToDos(int id) async {
    try {
      loading(true);
      var response = await RemoteService.fetchToDos(id);
      if (response != null ){
        todos.value = response;

      }

    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
    finally{
      loading(false);
    }
  }
}
