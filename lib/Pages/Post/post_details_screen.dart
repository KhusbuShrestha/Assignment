import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/comment_controller.dart';
import 'package:flutter_application_task/Controller/post_controller.dart';
import 'package:flutter_application_task/Controller/post_details_controller.dart';
import 'package:flutter_application_task/Remote_Service/remote_service.dart';
import 'package:flutter_application_task/const/color.dart';
import 'package:flutter_application_task/const/text_user_infro.dart';
import 'package:flutter_application_task/const/text_controller.dart';
import 'package:get/get.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = Get.find<PostController>();
    var postDetails = Get.find<PostDetailController>();
    var comment = Get.find<CommentController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondarycolor,
        onPressed: () {
          Get.bottomSheet(
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  GText(text: "Add Comment"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: body,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.comment,
                          color: Colors.black,
                        ),
                        hintText: "Comment",
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) =>
                          value!.isEmpty ? 'Empty field found' : null,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Map data = {
                          "postId": comment.comment[0].postId,
                          "name": "Clementine Bauch",
                          "email": "Nathan@yesenia.net",
                          "body": body.text,
                        };
                        if (body.text.isEmpty) {
                          Get.snackbar("ERROR", "Please enter some text!");
                          return;
                        }
                        await RemoteService.postData(
                            "posts/${comment.comment[0].postId}/comments",
                            data);
                        body.clear();
                      },
                      child: Text("Post"))
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add_comment),
      ),
      body: Obx(() {
        if (post.loading.isTrue && comment.loading.isTrue) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comment.comment.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = comment.comment.value[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(214, 185, 185, 174)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GText(text: mydata.name.toString()),
                                      GText(text: mydata.email.toString())
                                    ],
                                  ),
                                  subtitle: Text(
                                    mydata.body.toString(),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          );
        }
      }),
    );
  }
}
