import 'package:flutter/material.dart';
import 'package:flutter_application_task/Pages/Photo/album_screen.dart';
import 'package:flutter_application_task/Pages/Post/user_post_screen.dart';
import 'package:flutter_application_task/Pages/ToDos/todos.dart';
import 'package:flutter_application_task/const/color.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int barIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        snakeViewColor: AppColors.secondarycolor,
        snakeShape: SnakeShape.rectangle,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (int value) {
          setState(() {
            barIndex = value;
          });
        },
        currentIndex: barIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note_alt_sharp,
            ),
            label: "Post",
            activeIcon: Icon(
              Icons.notes_sharp,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album_outlined,
            ),
            label: "Album",
            activeIcon: Icon(
              Icons.photo_album_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.toc_outlined,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.table_rows_rounded,
            ),
            label: "ToDos",
          ),
        ],
      ),
      body: barIndex == 0
          ? const UserPostScreen()
          : barIndex == 1
              ? const AlbumScreen()
              : const ToDosScreen(),
    );
  }
}
