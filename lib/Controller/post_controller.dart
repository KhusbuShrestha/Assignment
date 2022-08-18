import 'package:flutter/material.dart';
import 'package:flutter_application_task/Model/post_model.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:get/get.dart';



class PostController extends GetxController{
  var postList = <PostModel>[].obs;
  var loading = true.obs;
  
  Future getPostList() async {
    try{
      loading(true);
      var response = await RemoteService.fetchPost();
      if (response != null){
        postList.value = response;
      }
      
    }catch(e){
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPostList();
  }
}