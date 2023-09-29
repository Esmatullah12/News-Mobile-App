import 'package:flutter/material.dart';
import '../Widgets/news_tile.dart';
import '../Widgets/bottom_actionb_bar.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite News'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: bookmarkedNews.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                    news: bookmarkedNews[index],
                  );
                },
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
        ));
  }
}
