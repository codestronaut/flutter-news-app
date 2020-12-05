/*
 * Article Class 
 */
import 'dart:convert';

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  // Contructor
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  // Named Constructor
  // To convert JSON to article object
  Article.fromJson(Map<String, dynamic> article) {
    author = article['author'];
    title = article['title'];
    description = article['description'];
    url = article['url'];
    urlToImage = article['urlToImage'];
    publishedAt = article['publishedAt'];
    content = article['content'];
  }
}

// Parsing JSON to Object Article
List<Article> parseArticles(String json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}
