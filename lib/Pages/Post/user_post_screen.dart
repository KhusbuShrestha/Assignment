import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/user_post_controller.dart';
import 'package:flutter_application_task/Pages/Photo/album_screen.dart';
import 'package:get/get.dart';

class UserPostScreen extends StatelessWidget {
  const UserPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userPost = Get.find<UserPostController>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Post"),
          centerTitle: true,
        ),
        body: Obx((() {
          if (userPost.loading.isTrue) {
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
                    itemCount: userPost.userPost.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = userPost.userPost[index];
                      return InkWell(
                        onTap: () {
                          print("object");

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
                                      color: Color.fromRGBO(214, 185, 185, 174)
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
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
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                // Text(post.postList[0].title.toString())
              ],
            ));
          }
        })));
  }
}
