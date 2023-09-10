class NewsItem {
  final String imagePath;
  final String title;
  final String date;
  final String category;
  final String newsText;
  final bool isBookmarked;

  NewsItem({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.category,
    required this.newsText,
    this.isBookmarked = true
  });
}
