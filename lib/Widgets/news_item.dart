class NewsItem {
  late String imagePath;
  late String title;
  late String date;
  late String category;
  late String text;
  late bool isBookmarked;

  NewsItem(
      {required this.imagePath,
      required this.title,
      required this.date,
      required this.category,
      required this.text,
      this.isBookmarked = true});

  set setNewsTitle(String NewsTitle) {
    title = NewsTitle;
  }

  // Setter for newsText
  set setNewsText(String newsText) {
    text = newsText;
  }

  // Setter for newsCategory
  set setNewsCategory(String NewsCategory) {
    category = NewsCategory;
  }
}
