import 'package:flutter/material.dart';
import 'package:flutter_application_task/Controller/todos_controller.dart';
import 'package:get/get.dart';

class ToDosScreen extends StatelessWidget {
  const ToDosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todos = Get.find<ToDosController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Dos"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (todos.loading.isTrue) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: todos.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = todos.todos.value[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              // height: 200,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(214, 185, 185, 174)),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: ListTile(
                                        leading: mydata.completed == true
                                            ? Icon(Icons.done_outlined)
                                            : Icon(Icons.rotate_right_sharp),
                                        title: Text(mydata.title.toString()),
                                        trailing: mydata.completed == true
                                            ? Text("Complete")
                                            : Text("Incomplete")),
                                  ),
                                ],
                              ),
                            )),
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
