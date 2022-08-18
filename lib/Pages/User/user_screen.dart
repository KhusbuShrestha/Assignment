import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/album_controller.dart';
import 'package:flutter_application_task/Controller/photo_controller.dart';
import 'package:flutter_application_task/Controller/todos_controller.dart';
import 'package:flutter_application_task/Controller/user_controller.dart';
import 'package:flutter_application_task/Controller/user_post_controller.dart';
import 'package:flutter_application_task/Pages/Bottom_Nav/bottom_nav_screen.dart';
import 'package:flutter_application_task/Pages/Photo/album_screen.dart';
import 'package:flutter_application_task/const/text_user_infro.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Get.find<UserController>();
    var photo = Get.find<PhotoController>();
    var todos = Get.find<ToDosController>();
    var album = Get.find<AlbumController>();
    var userPOst = Get.find<UserPostController>();
    return Scaffold(
      // appBar: AppBar(),
      body: Obx(() {
        if (user.loading.isTrue) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 5.0,
                      // mainAxisSpacing: 5.0,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: user.user.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = user.user.value[index];
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(214, 185, 185, 174)
                                //  color: Colors.red

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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Text(mydata.name
                                            .toString()
                                            .substring(0, 1))),
                                  ),
                                ),
                                // Text(
                                //   mydata.email.toString(),
                                //   textAlign: TextAlign.start,
                                // ),
                                ListTile(
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        mydata.name.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(mydata.email.toString(),
                                          textAlign: TextAlign.center),
                                      //  Text(mydata.website.toString(),
                                      // textAlign: TextAlign.start)
                                    ],
                                  ),
                                ),

                                ListTile(
                                  leading: IconButton(
                                      onPressed: () {
                                        print("object");
                                        Get.defaultDialog(
                                            title: "User Information",
                                            content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GText(
                                                    text: "Name: " +
                                                        mydata.name.toString()),
                                                GText(
                                                    text: "User Name: " +
                                                        mydata.username
                                                            .toString()),
                                                GText(
                                                    text: "Email: " +
                                                        mydata.email
                                                            .toString()),

                                                GText(
                                                    text: "City: " +
                                                        mydata.address!.city
                                                            .toString()),
                                                GText(
                                                    text: "Zipcode: " +
                                                        mydata.address!.zipcode
                                                            .toString()),

                                                GText(
                                                    text: "GEO Lat: " +
                                                        mydata.address!.geo!.lat
                                                            .toString()),
                                                GText(
                                                    text: "GEO Lng: " +
                                                        mydata.address!.geo!.lng
                                                            .toString()),
                                                GText(
                                                    text: "Phone: " +
                                                        mydata.phone
                                                            .toString()),

                                                GText(
                                                    text: "Website: " +
                                                        mydata.website
                                                            .toString()),

                                                GText(
                                                    text: "Company Name: " +
                                                        mydata.company!.name
                                                            .toString()),

                                                GText(
                                                    text: "Catch Phrase: " +
                                                        mydata.company!
                                                            .catchPhrase
                                                            .toString()),
                                                GText(
                                                    text: "Catch Phrase: " +
                                                        mydata.company!.bs
                                                            .toString()),

                                                // Text("Name: " + mydata.name.toString()),
                                                // Text("User Name: " + mydata.name.toString()),
                                                // Text("Name: " + mydata.email.toString()),
                                                // Text("Email: " + mydata.name.toString()),
                                              ],
                                            ));
                                      },
                                      icon: Icon(
                                        Icons.info_outline_rounded,
                                      )),
                                  // trailing: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.playlist_add_check_circle_outlined,), label: Text("Activity")),)
                                  trailing: IconButton(
                                      onPressed: () {
                                        photo.getPhoto(mydata.id!);
                                        todos.getToDos(mydata.id!);
                                        album.getalbum(mydata.id!);
                                        userPOst.getUserPost(mydata.id!);
                                        Get.to(() => BottomNavScreen());
                                        print("object");
                                      },
                                      icon: Icon(
                                        Icons
                                            .playlist_add_check_circle_outlined,
                                      )),
                                )

                                // Row(
                                //   children: [
                                //     Expanded(
                                //         flex: 1,
                                //         child: ElevatedButton.icon(
                                //             onPressed: () {},
                                //             icon: Icon(
                                //               Icons
                                //                   .playlist_add_check_circle_outlined,
                                //             ),
                                //             label: Text("Info"))),
                                //     Expanded(
                                //         flex: 1,
                                //         child: ElevatedButton.icon(
                                //             onPressed: () {},
                                //             icon: Icon(
                                //               Icons
                                //                   .playlist_add_check_circle_outlined,
                                //             ),
                                //             label: Text("Activity")))
                                //   ],
                                // ),
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
