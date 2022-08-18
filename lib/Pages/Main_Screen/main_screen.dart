import 'package:flutter/material.dart';
import 'package:flutter_application_task/Pages/Post/post_screen.dart';
import 'package:flutter_application_task/Pages/ToDos/todos.dart';
import 'package:flutter_application_task/Pages/User/user_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile.com"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.padding,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
          ]),
        ),
        body: const TabBarView(
          children: [PostScreen(), UserScreen()],
        ),
      ),
    );
  }
}
