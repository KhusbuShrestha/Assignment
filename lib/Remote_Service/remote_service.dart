import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_task/Model/album_model.dart';
import 'package:flutter_application_task/Model/comment_model.dart';
import 'package:flutter_application_task/Model/photo_model.dart';
import 'package:flutter_application_task/Model/post_details_model.dart';
import 'package:flutter_application_task/Model/post_model.dart';
import 'package:flutter_application_task/Model/todos_model.dart';
import 'package:flutter_application_task/Model/user_model.dart';
import 'package:flutter_application_task/Model/user_post_model.dart';
import 'package:flutter_application_task/const/success_message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RemoteService {
  static var client = http.Client();
  static var baseURL = "https://jsonplaceholder.typicode.com";

  static Future<List<PostModel>?> fetchPost() async {
    try {
      var response = await client.get(Uri.parse(baseURL + "/posts"), headers: {
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return postModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  
// Post Details Remote Service
  static Future<PostDetailsModel?> fetchPostDetails(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL +"/posts/$id"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return postDetailsModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
  // COMMENT
  static Future<List<CommentModel>?> fetchComment(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL+"/posts/$id/comments"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return commentModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }

  // Photo
  static Future<List<PhotoModel>?> fetchPhoto(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL+"/albums/$id/photos"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return photoModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
  // Todos
  static Future<List<ToDosModel>?> fetchToDos(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL+"/users/$id/todos"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return toDosModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
  // Album
  static Future<List<AlbumModel>?> fetchAlbum(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL+"/users/$id/albums"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return albumModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }

  // User
  static Future<List<UserModel>?> fetchUser() async {
    try {
      var response = await client.get(Uri.parse(baseURL + "/users"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return userModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
   // User Post
  static Future<List<UserPostModel>?> fetchUserPost(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL+"/users/$id/posts"),
          headers: {'Accept': 'application/json'});
          if (response.statusCode == 200) {
        var jsonString = response.body;
        return userPostModelFromJson(jsonString);

      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }


  // Post Data
  static Future postData(String endPoint, Map data) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");

      var response = await client.post(Uri.parse(baseURL + endPoint),
          headers: {
            
          },
          body: jsonEncode(data));
      print(response.body);
      if (response.statusCode == 201) {
        var result = json.decode(response.body);
        // Get.snackbar("Success","Posted successfully!");
        successMessage("Posted Successfully");
      } else {
        Get.snackbar("Error","Please add all the details!");
     
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }
}
