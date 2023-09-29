import 'package:flutter/material.dart';
import 'package:news_app/Widgets/news_item.dart';

List<NewsItem> bookmarkedNews = [];

class NewsTile extends StatefulWidget {
  final NewsItem news;

  const NewsTile({required this.news});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    isBookmarked = bookmarkedNews.contains(widget.news);
  }

  void toggleBookmark() {
    setState(() {
      if (isBookmarked) {
        bookmarkedNews
            .remove(widget.news); // You should have a list 'bookmarkedNews'
      } else {
        bookmarkedNews.add(widget.news);
      }
      isBookmarked = !isBookmarked;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: toggleBookmark,
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
              color: isBookmarked ? Color(0xFF288E01) : Colors.black,
              size: 30,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.news.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  "${widget.news.date} " + "•" + " ${widget.news.category}",
                  textDirection: TextDirection.rtl,
                )
              ],
            ),
          ),
          SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "${widget.news.imagePath}",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
