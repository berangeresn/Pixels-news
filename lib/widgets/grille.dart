import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:tech_news/models/date_convertisseur.dart';
import 'package:webfeed/webfeed.dart';
import 'page_detail.dart';


class Grille extends StatefulWidget {

  RssFeed rssFeed;

  Grille(RssFeed rssFeed) {
    this.rssFeed = rssFeed;
  }

  @override
  State<StatefulWidget> createState() {
    return _GrilleState();
  }

}

class _GrilleState extends State<Grille> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.rssFeed.items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
        itemBuilder: (context, i) {
          RssItem item = widget.rssFeed.items[i];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return PageDetail(item);
              }));
            },
            child: Card(
              elevation: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CustomText(item.author),
                      CustomText(DateConverter().convertirDate(item.pubDate), color: Colors.blue,),
                    ],
                  ),
                  CustomText(item.title),
                  Card(
                    elevation: 7.5,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Image.network(item.enclosure.url, fit: BoxFit.fill,),
                    ),
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}