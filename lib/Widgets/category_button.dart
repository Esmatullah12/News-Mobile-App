import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  CategoryButton({
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
          if (widget.isSelected) {

          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isSelected ? Color(0xFF388E01) : Colors.grey[300],
          textStyle: TextStyle(fontSize: 18),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
          elevation: 0,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

