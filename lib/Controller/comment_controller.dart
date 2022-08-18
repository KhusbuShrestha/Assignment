
import 'package:flutter_application_task/Model/comment_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';

class CommentController extends GetxController{
  var comment = <CommentModel>[].obs;
  var loading = true.obs;
  Future getComment(int id) async{
    try{
      loading(true);
      var response = await RemoteService.fetchComment(id);
      if(response != null){
        comment.value = response;
      }

    } catch(e){Get.snackbar("ERROR", e.toString());
    }
    finally{
      loading(false);
    }
  }
} 