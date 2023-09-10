import 'package:flutter/material.dart';

class BottomActionBar extends StatefulWidget {
  const BottomActionBar({Key? key}) : super(key: key);

  @override
  State<BottomActionBar> createState() => _BottomActionBarState();
}

class _BottomActionBarState extends State<BottomActionBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Icon(
                  Icons.person_outline,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (ModalRoute.of(context)!.settings.name != '/favorite_news'){
                    Navigator.pushNamed(context, '/favorite_news');
                  }
                },
                child: Icon(Icons.bookmark_border, size: 35),
              ),
              GestureDetector(
                onTap: (){
                  if (ModalRoute.of(context)!.settings.name != '/home'){
                    Navigator.pushNamed(context, '/home');
                  }
                },
                  child: Icon(Icons.home, size: 35, color: Color(0xFF388E01),),),
            ],
          )),
    );
  }
}
