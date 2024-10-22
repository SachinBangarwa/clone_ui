import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:clone_ui/multilist/categroy_file_json.dart';
import 'package:clone_ui/multilist/color_file_json.dart';
import 'package:clone_ui/multilist/recent_file_json.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            getStore(),
            SizedBox(
              height: 30,
            ),
            getRecentFile(),
            SizedBox(
              height: 10,
            ),
            getCategoryFiles()
          ],
        ),
      ),
    );
  }

  Widget getStore() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: white.withOpacity(0.2), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: white.withOpacity(0.2), shape: BoxShape.circle),
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.only(left: 20, right: 90),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: CircleProgressBar(
                    foregroundColor: white,
                    backgroundColor: white.withOpacity(0.2),
                    value: 0.8,
                    child: Center(
                      child: AnimatedCount(
                        style: TextStyle(color: Colors.white),
                        count: 0.65,
                        duration: Duration(milliseconds: 300),
                        unit: "%",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "10.8 GB of 15 GB used",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 12, right: 12, bottom: 10),
                          child: Text(
                            "Buy Storage",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getRecentFile() {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent File",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(RecentFileJson.length, (value) {
                  var userimag =
                      "https://cdn.iconscout.com/icon/free/png-256/free-gallery-icon-download-in-svg-png-gif-file-formats--photo-image-saas-icons-pack-miscellaneous-902099.png?f=webp";
                  if (RecentFileJson[value]["type"] == "image") {
                    if (RecentFileJson[value]["File_name"] == "8uif747GGill") {
                      userimag =
                          "https://cdn.iconscout.com/icon/free/png-256/free-gallery-icon-download-in-svg-png-gif-file-formats--photo-image-saas-icons-pack-miscellaneous-902099.png?f=webp";
                    }
                  } else {
                    userimag =
                        "https://cdn-icons-png.flaticon.com/128/5355/5355492.png";
                  }
                  return Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Container(
                      height: 160,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: primary,
                          image: DecorationImage(
                              image: NetworkImage(RecentFileJson[value]["img"]),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlurryContainer(
                            padding: EdgeInsets.zero,
                            blur: 0.5,
                            child: Container(
                              width: size.width * 0.8,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                color: white.withOpacity(0.8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      userimag,
                                      width: 20,
                                      height: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      RecentFileJson[value]["File_name"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ));
  }

  Widget getCategoryFiles() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categoryJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                        color: secondary.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(22)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          categoryJson[index]['img'],
                          width: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoryJson[index]['text'],
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoryJson[index]['file_count'],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: secondary.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
