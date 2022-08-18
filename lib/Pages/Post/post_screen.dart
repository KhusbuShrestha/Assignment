import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/album_controller.dart';
import 'package:flutter_application_task/Controller/comment_controller.dart';
import 'package:flutter_application_task/Controller/photo_controller.dart';
import 'package:flutter_application_task/Controller/post_controller.dart';
import 'package:flutter_application_task/Controller/post_details_controller.dart';
import 'package:flutter_application_task/Controller/todos_controller.dart';
import 'package:flutter_application_task/Pages/Photo/album_screen.dart';
import 'package:flutter_application_task/Pages/Post/post_details_screen.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = Get.find<PostController>();
    var postDetails = Get.find<PostDetailController>();
    var comment = Get.find<CommentController>();
    var photo = Get.find<PhotoController>();
    var todos = Get.find<ToDosController>();
    var album = Get.find<AlbumController>();
    return Scaffold(
      // appBar: AppBar(),
      body: Obx(
        (() {
          if (post.loading.isTrue) {
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
                      itemCount: post.postList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = post.postList[index];
                        return InkWell(
                          onTap: () {
                            print("object");
                            postDetails.getPostDetail(mydata.id!);
                            comment.getComment(mydata.id!);
                            print(mydata.id);
                            photo.getPhoto(mydata.id!);
                            todos.getToDos(mydata.id!);
                            // album.getalbum(mydata.id!);

                            // Get.to(()=> PostDetailsScreen());
                            Get.to(() => AlbumScreen());
                          },
                          child: Column(
                            children: [
                              // Text(mydata.title.toString()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(214, 185, 185, 174)
                                        // gradient: LinearGradient(
                                        //     colors: [
                                        //       Color.fromARGB(0, 97, 221, 233),
                                        //       Color.fromARGB(214, 185, 185, 174)
                                        //     ],
                                        //     begin: FractionalOffset.bottomRight,
                                        //     // end: FractionalOffset.topRight,
                                        //     stops: [0.0, 1.0],
                                        //     tileMode: TileMode.clamp),
                                        ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      height: 100,
                                      child: ListTile(
                                          title: Text(
                                            mydata.title.toString(),
                                            textAlign: TextAlign.start,
                                          ),
                                          subtitle: Text(
                                            mydata.body.toString(),
                                            textAlign: TextAlign.left,
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {
                                              comment.getComment(mydata.id!);
                                              print(mydata.id!);
                                              Get.to(() => PostDetailsScreen());
                                            },
                                            icon: Icon(Icons.comment),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
