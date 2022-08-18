import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/photo_controller.dart';
import 'package:get/get.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var photo = Get.find<PhotoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (photo.loading.isTrue) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 5.0,
                      // mainAxisSpacing: 5.0,
                    ),
                    itemCount: photo.photo.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = photo.photo.value[index];
                      return InkWell(
                        child: Column(
                          children: [
                            mydata.url == null
                                ? Icon(Icons.loop_sharp)
                                : Container(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width,
                                    // width: 150,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              mydata.url!.toString()),
                                          // image: AssetImage("images/try.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                            ListTile(
                              title: Text(mydata.title.toString()),
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
