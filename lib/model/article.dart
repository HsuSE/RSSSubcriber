import 'package:xml/xml.dart';

class Article {

  final String title;
  final String link;
  final String description;
  final String pubDate;
  final String creator;

  Article(this.title, this.link, this.description, this.pubDate, this.creator);

  factory Article.fromElement(XmlElement articleElement) {
    return Article(
      articleElement.getElement('title')?.text ?? "",
      articleElement.getElement('link')?.text ?? "",
      articleElement.getElement('description')?.text ?? "",
      articleElement.getElement('pubDate')?.text ?? "",
      articleElement.getElement('creator')?.text ?? "",
    );
  }
}