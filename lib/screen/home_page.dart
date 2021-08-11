import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rsssubscriber/model/article.dart';
import 'package:rsssubscriber/widget/article_list_tile.dart';
import 'package:xml/xml.dart';


class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  List<Article> articles = [];

  Future<void> getRSSContent() async {
    final rssLink = Uri.parse('https://www.ithome.com.tw/rss');
    final response = await http.get(rssLink);
    
    print(response.statusCode);    

    if (response.statusCode != 200) {
      return;
    }

    final xmlResult = XmlDocument.parse(response.body);
    setState(() {
      articles = xmlResult.findAllElements('item')
                            .map<Article>((e) => Article.fromElement(e)).toList();
    });

  }

  @override
  void initState() {
    getRSSContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RSS"), centerTitle: true),
      body: Container(
        color: Colors.grey.shade200,
        child: RefreshIndicator(
          onRefresh: getRSSContent,
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleListTile(article: articles[index]);
            }
          )
        ),
      )
    );
  }
}