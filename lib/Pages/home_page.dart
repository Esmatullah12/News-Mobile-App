import 'package:flutter/material.dart';
import 'package:news_app/Widgets/news_item.dart';
import '../Widgets/carousel.dart';
import '../Widgets/category_button.dart';
import '../Widgets/news_tile.dart';
import '../Widgets/news_data.dart';
import '../Widgets/bottom_actionb_bar.dart';
import 'news_detailPage.dart';

NewsData newsData = NewsData();
const List<String> categories = ["ورزشی", "تکنالوژی", "سیاسی", "اقتصادی", "صحی", "هنری", "محیط زیست", "فرهنگی", "اموزشی", "حوادث جرمی",];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int selectedButtonIndex = -1;
  GestureDetector buildNewsGesture(BuildContext context, NewsItem news) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              imagePath: news.imagePath,
              title: news.title,
              date: news.date,
              newsText: news.newsText,
            ),
          ),
        );
      },
      child: NewsTile(
        news: news
        )
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.menu_rounded,
                              color: Colors.black,
                            )),
                      ),
                      Text(
                        "اخبار",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -2,
                          color: Color(0xFF388E01),
                        ),
                      ),
                    ]),
              ),
              Carousel(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (int i = 0; i < categories.length; i++)
                          CategoryButton(
                            text: categories[i],
                            isSelected: selectedButtonIndex == i,
                            onPressed: () {
                              setState(() {
                                selectedButtonIndex = i;
                              });
                            },
                          ),
                      ],
                    ),
                  )
              ),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: newsData.newsItems.map((news){
                      return buildNewsGesture(
                          context,
                          news
                      );
                    }).toList(),
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
                  child: BottomActionBar()
              )
            ],
          ),
        ));
  }
}


