import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsssubscriber/model/article.dart';
import 'package:rsssubscriber/screen/webview_page.dart';

class ArticleListTile extends StatelessWidget {
  final Article article;

  const ArticleListTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 2, offset: Offset(0, 5))
          ]),
          child: Row(
            children: [
              Container(
                  constraints: BoxConstraints(maxHeight: 60),
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(60.0)),
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        'assets/images/ithome.jpg',
                        fit: BoxFit.fill,
                      ))),
              Flexible(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 5),
                  Text(article.pubDate, style: TextStyle(color: Colors.grey.shade500)),
                ],
              ))),
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (build) => WebviewPage(url: article.link)));
      },
    );
  }
}
