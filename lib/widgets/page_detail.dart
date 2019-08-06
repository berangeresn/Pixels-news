import 'package:flutter/material.dart';
import 'Liste.dart';
import 'package:webfeed/webfeed.dart';
import 'package:tech_news/models/date_convertisseur.dart';
import 'custom_text.dart';


class PageDetail extends StatelessWidget {

  PageDetail(RssItem item) {
    this.item = item;
  }

  RssItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détail de l'article"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            padding(),
            CustomText(item.title, fontSize: 25.0,),
            padding(),
            Card(
              elevation: 7.5,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Image.network(item.enclosure.url, fit: BoxFit.cover,),
              ),
            ),
            padding(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText(DateConverter().convertirDate(item.pubDate), color: Colors.blue,),
              ],
            ),
            padding(),
            CustomText(item.description),
            padding()
          ],
        ),
      ),
    );
  }

  Padding padding() {
    return Padding(padding: EdgeInsets.only(top: 20.0));
  }

}