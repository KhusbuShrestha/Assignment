import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/album_controller.dart';
import 'package:flutter_application_task/Controller/photo_controller.dart';
import 'package:flutter_application_task/Pages/Photo/photo.dart';
import 'package:get/get.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var album = Get.find<AlbumController>();
    var photo = Get.find<PhotoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Album",
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (album.loading.isTrue) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Text(comment.comment.value.length .toString())

                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: album.album.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = album.album.value[index];
                      return InkWell(
                        onTap: () {
                          photo.getPhoto(mydata.id!);
                          Get.to(() => PhotosScreen());
                        },
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Icon(
                                  Icons.photo_album,
                                  color: Colors.black,
                                ),
                                title: Text(mydata.title.toString()),
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
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
