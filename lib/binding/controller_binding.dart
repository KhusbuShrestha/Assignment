

import 'dart:ffi';

import 'package:flutter_application_task/Controller/album_controller.dart';
import 'package:flutter_application_task/Controller/comment_controller.dart';
import 'package:flutter_application_task/Controller/photo_controller.dart';
import 'package:flutter_application_task/Controller/post_controller.dart';
import 'package:flutter_application_task/Controller/post_details_controller.dart';
import 'package:flutter_application_task/Controller/todos_controller.dart';
import 'package:flutter_application_task/Controller/user_controller.dart';
import 'package:flutter_application_task/Controller/user_post_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PostController());
    Get.put(PostDetailController());
    Get.put(CommentController());
    Get.put(PhotoController());
    Get.put(ToDosController());
    Get.put(AlbumController());
    Get.put(UserController());
    Get.put(UserPostController());
  }}