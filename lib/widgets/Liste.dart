import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'custom_text.dart';
import 'package:tech_news/models/date_convertisseur.dart';
import 'page_detail.dart';


class Liste extends StatefulWidget {

  RssFeed rssFeed;

  Liste(RssFeed rssFeed){
    this.rssFeed = rssFeed;
  }

  @override
  _ListeState createState() => new _ListeState();

}

class _ListeState extends State<Liste> {

  @override
  Widget build(BuildContext context) {
    final taille = MediaQuery.of(context).size.width / 2.6;
    return ListView.builder(
        itemCount: widget.rssFeed.items.length,
        itemBuilder: (context, i) {
          RssItem item = widget.rssFeed.items[i];
          return Container(
            child: Card(
              elevation: 10.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return PageDetail(item);
                  }));
                },
                child: Column(
                  children: <Widget>[
                    padding(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(DateConverter().convertirDate(item.pubDate), color: Colors.blue,),
                      ],
                    ),
                    padding(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Card(
                          elevation: 7.5,
                          child: Container(
                            width: taille,
                            height: MediaQuery.of(context).size.height / 6.5,
                            child: Image.network(item.enclosure.url, fit: BoxFit.cover,),
                          ),
                        ),
                        Container(
                          width: taille,
                          margin: EdgeInsets.only(right:20.0),
                          child: CustomText(item.title,),
                        ),
                      ],
                    ),
                    padding(),
                  ],
                ),
              ),
            ),
            padding: EdgeInsets.only(right: 7.5, left: 7.5),
            margin: EdgeInsets.all(2.0),
          );
  });
 }

 Padding padding() {
    return Padding(padding: EdgeInsets.only(top: 10.0));
 }

}