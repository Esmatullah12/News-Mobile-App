import 'package:flutter/material.dart';
import '../Widgets/bottom_actionb_bar.dart';

class NewsDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String newsText;

  NewsDetailPage(
      {required this.imagePath,
      required this.title,
      required this.date,
      required this.newsText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  Text(
                    "اخبار",
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF388E01),
                        letterSpacing: -2),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 230,
                width: 500,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        date,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        newsText,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      )
                      // Other news details can be added here
                    ],
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: BottomActionBar())
          ],
        ),
      ),
    );
  }
}
