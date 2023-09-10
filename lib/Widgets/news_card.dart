import 'package:flutter/material.dart';

class newsCard extends StatelessWidget {
  final String title;
  final String category;
  final String imagePath;
  const newsCard({required this.title, required this.category, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(this.imagePath),
          fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
        )
      ),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
            ),
            child: Text(this.category,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 1
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 15, 30),
            child: Text(this.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1
            ),
              textDirection: TextDirection.rtl,
            ),
          )
        ],
      ),
    );
  }
}
