import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tech_news/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'chargement.dart';
import 'Liste.dart';
import 'grille.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _count = 0;

  RssFeed rssFeed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
          child: BodyCustom(),
          onRefresh: _handleRefresh,
      ),
    );
  }

  Widget BodyCustom() {
    if (rssFeed == null) {
      return Chargement();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        // Liste
        return Liste(rssFeed);
      } else {
        // Grille
        return Grille(rssFeed);
      }
    }
  }

  Future<Null> parse() async {
      RssFeed recu = await Parser().chargerRSS();
      if (recu != null) {
        setState(() {
          rssFeed = recu;
          print(rssFeed.items.length);
          rssFeed.items.forEach((rssItem){
            RssItem item = rssItem;
            print(item.title);
            print(item.categories);
            print(item.pubDate);
            print(item.description);
            print(item.enclosure);
            });
        });
      }
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 3));

    setState(() {
      _count += 5;
    });

    return null;
  }
}