class News {
  String title;
  String text;
  String category;
  String date;
  String imageUrl;

  // Constructor
  News({
    required this.title,
    required this.text,
    required this.category,
    required this.date,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'category': category,
      'date': date,
      'imageUrl': imageUrl,
    };
  }
}
