
import 'package:flutter_application_task/Model/post_details_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController{
  var postDetail = PostDetailsModel().obs;
  var loading = true.obs;
  Future getPostDetail(int id) async{
    try{
      loading(true);
      var response = await RemoteService.fetchPostDetails(id);
      if(response != null){
        postDetail.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }
  
 
}