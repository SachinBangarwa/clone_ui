import 'package:animate_do/animate_do.dart';
import 'package:clone_ui/multilist/categroy_file_json.dart';
import 'package:clone_ui/multilist/color_file_json.dart';
import 'package:clone_ui/multilist/file_detail_page.dart';
import 'package:clone_ui/screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  int tabsindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            getTabs(),
            SizedBox(
              height: 30,
            ),
            getDateSection(),
            SizedBox(
              height: 20,
            ),
            tabsindex == 0 ? getListMyCloudItems() : getListTeamCloudItems()
          ],
        ),
      ),
    ));
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          tabsindex == 0
              ? Flexible(
                  child: ElasticIn(
                    child: GestureDetector(
                      onTap: () {
                        tabsindex = 0;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: (size.width - 45) / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: primary),
                          child: Center(
                            child: Text(
                              "My Cloud",
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    tabsindex = 0;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // CupertinoDynamicColor.withBrightness(color: Colors.black, darkColor: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          "Team Cloud",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
          tabsindex == 1
              ? Flexible(
                  child: ElasticIn(
                    child: GestureDetector(
                      onTap: () {
                        tabsindex = 1;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: (size.width - 45) / 2,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: primary),
                          child: Center(
                            child: Text(
                              "My Cloud",
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      tabsindex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // CupertinoDynamicColor.withBrightness(color: Colors.black, darkColor: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          "Team Cloud",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget getDateSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Date Modified",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.arrow_circle_down,
              size: 20,
            )
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.border_all_outlined,
              color: black.withOpacity(0.5),
            ))
      ],
    );
  }

  Widget getListMyCloudItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(myCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => FileDetailPage (
              title:myCloudFilesContentJson[index]['title'],
              fileCount: myCloudFilesContentJson[index]['file_count'],
            )));
          },
          child: Container(
            width: (size.width - 50) / 2,
            height: (size.width - 50) / 2,
            decoration: BoxDecoration(
                color: secondary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  myCloudFilesContentJson[index]['img'],
                  width: 55,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  myCloudFilesContentJson[index]['title'] +
                      " ( ${myCloudFilesContentJson[index]['file_count']} )",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getListTeamCloudItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(teamCloudFilesContentJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => FileDetailPage(
              title:teamCloudFilesContentJson[index]['title'],
              fileCount: teamCloudFilesContentJson[index]['file_count'],
            )));
          },
          child: Container(
            width: (size.width - 50) / 2,
            height: (size.width - 50) / 2,
            decoration: BoxDecoration(
                color: secondary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  teamCloudFilesContentJson[index]['img'],
                  width: 55,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                 teamCloudFilesContentJson[index]['title']+
                      " ( ${teamCloudFilesContentJson[index]['file_count']} )",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
