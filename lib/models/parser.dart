import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';


class Parser {

  final url = 'http://www.lemonde.fr/pixels/rss_full.xml';

  Future chargerRSS() async {
    final reponse = await http.get(url);
    if (reponse.statusCode == 200) {
      final feed = new RssFeed.parse(reponse.body);
      return feed;
    } else {
      print("Erreur ${reponse.statusCode}");
    }
  }
}
