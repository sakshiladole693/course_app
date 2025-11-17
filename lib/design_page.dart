import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

class DesignPage extends StatelessWidget {
  final int pageIndex;
  DesignPage({super.key, required this.pageIndex});

  final List<Map> courseList = [
    {
      'bgColor': [
        Color.fromRGBO(197, 4, 98, 1),
        Color.fromRGBO(80, 3, 112, 1),
        Color.fromRGBO(80, 3, 112, 1),
      ],
      'headingText': 'UX Designer from Scratch.',
      'infoText':
          'Basic guideline & tips & tricks for how to become a UX designer easily.',
      'author': 'Jenny',
      'rating': '4.8',
      'view': '(20 review)',
    },
    {
      'bgColor': [
        Color.fromRGBO(0, 77, 228, 1),
        Color.fromRGBO(1, 47, 135, 1),
        Color.fromRGBO(1, 47, 135, 1),
        Color.fromRGBO(1, 47, 135, 1),
      ],
      'headingText': 'Design Thinking  The Beginner',
      'infoText':
          'Basic guideline & tips & tricks for how to convert your thought in Design.',
      'author': 'Lucia',
      'rating': '4.9',
      'view': '(15 review)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: courseList[pageIndex]['bgColor'],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 30),
              child: textContainer(context),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return listCard();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, size: 26, color: Colors.white),
        ),
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                courseList[pageIndex]['headingText'],
                style: GoogleFonts.jost(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                courseList[pageIndex]['infoText'],
                style: GoogleFonts.jost(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(228, 205, 225, 1),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/profile.svg'),
                  const SizedBox(width: 5),
                  Text(
                    "Author: ",
                    style: GoogleFonts.jost(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(228, 205, 225, 1),
                    ),
                  ),
                  Text(
                    courseList[pageIndex]['author'],
                    style: GoogleFonts.jost(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 33.5),
                  Text(
                    courseList[pageIndex]['rating'],
                    style: GoogleFonts.jost(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(
                    courseList[pageIndex]['view'],
                    style: GoogleFonts.jost(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(228, 205, 225, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  Container listCard() {
    return Container(
      padding: EdgeInsets.all(6),
      height: 70,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            offset: Offset(2, 8),
            blurRadius: 40,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 50,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 239, 239, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset("assets/svg/youtube.svg"),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introduction",
                style: GoogleFonts.jost(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${courseList[pageIndex]['headingText']}....",
                style: GoogleFonts.jost(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(143, 143, 143, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}