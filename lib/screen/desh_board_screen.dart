import 'package:clone_ui/multilist/salomonBottombar_file.dart';
import 'package:clone_ui/screen/folder_screen.dart';
import 'package:clone_ui/screen/home_screen.dart';
import 'package:clone_ui/screen/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DeshBoardScreen extends StatefulWidget {
  const DeshBoardScreen({super.key});

  @override
  State<DeshBoardScreen> createState() => _DeshBoardScreenState();
}

class _DeshBoardScreenState extends State<DeshBoardScreen> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getTabs(),
      body: IndexedStack(
        index: pageindex,
        children: [
          HomeScreen(),
          FolderScreen(),
          TrashScreen(),
        ],
      ),
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
        currentIndex: pageindex,
        onTap: (value) {
          pageindex = value;
          setState(() {});
        },
        items: List.generate(rootAppJson.length, (index) {
          // List rj=rootAppJson[value];
          return SalomonBottomBarItem(
              icon: Icon(
                rootAppJson[index]["icon"],
                color: rootAppJson[index]["color"],
                size: 30,
              ),
              title: Text(rootAppJson[index]["title"]),
              selectedColor: rootAppJson[index]["color"]);
        }));
  }
}
