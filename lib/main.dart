import 'package:course_information_page/design_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CourseApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CourseApp extends StatefulWidget {
  const CourseApp({super.key});

  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  List<Map> courseList = [
    {
      'bgColor': [Color.fromRGBO(197, 4, 98, 1), Color.fromRGBO(80, 3, 112, 1)],
      'headingText': 'UX Designer from \nScratch.',
      'imgPath': 'assets/svg/poster1.svg',
    },
    {
      'bgColor': [Color.fromRGBO(0, 77, 228, 1), Color.fromRGBO(1, 47, 135, 1)],
      'headingText': 'Design Thinking \nThe Beginner',
      'imgPath': 'assets/svg/poster2.svg',
    },
  ];
  List<Map> categoryList = [
    {'img': 'assets/svg/uiux.svg', 'textCategory': 'UI/UX'},
    {'img': 'assets/svg/visual.svg', 'textCategory': 'VISUAL'},
    {'img': 'assets/svg/illutration.svg', 'textCategory': 'ILLUTRATION'},
    {'img': 'assets/svg/photo.svg', 'textCategory': 'PHOTO'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(205, 218, 218, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/svg/menu.svg"),
                      SvgPicture.asset("assets/svg/bell.svg"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Welcome to New\n",
                      style: GoogleFonts.jost(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Educourse',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 37,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        right: 15,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your keyword",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset("assets/svg/search.svg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 525,
              padding: EdgeInsets.only(left: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Course For You",
                    style: GoogleFonts.jost(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      itemCount: courseList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DesignPage(pageIndex: index),
                              ),
                            );
                          },
                          child: courseCard(index),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 20);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Course By Category",
                    style: GoogleFonts.jost(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return categoryCard(index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 25);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container courseCard(int courseIndex) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: courseList[courseIndex]['bgColor'],
          begin: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              courseList[courseIndex]['headingText'],
              style: GoogleFonts.jost(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            SvgPicture.asset(courseList[courseIndex]['imgPath']),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(int categoryIndx) {
    return SizedBox(
      height: 65,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Color.fromRGBO(25, 0, 56, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(categoryList[categoryIndx]['img']),
          ),
          SizedBox(height: 10),
          Text(
            categoryList[categoryIndx]['textCategory'],
            style: GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
