import "package:flutter/material.dart";
import 'news_card.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<newsCard> newsCards = [
    newsCard(
      title: "شرکت اپل نوآوری‌ها و رقابت در دنیای فناوری به وجود اورده",
      category: "ورزشی",
      imagePath: "images/apple.jpeg",
    ),
    newsCard(
        title: "تیم ملی افغانستان برنده جام اسیا",
        category: "سپورتی",
        imagePath: "images/flower.png"),
    newsCard(
        title: "درگیری طالبان همرای داعش",
        category: "سیاسی",
        imagePath: "images/sport.jpeg")
  ];
  late PageController _pageController;
  int _position = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: .93);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Set an appropriate height
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        itemCount: newsCards.length,
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        },
      ),
    );
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Center(child: widget);
      },
      child: Container(
        child: newsCards[position],
      ),
    );
  }
}
