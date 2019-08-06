import 'package:flutter/material.dart';
import 'custom_text.dart';


class Chargement extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        "Chargement en cours...",
        fontSize: 20.0,
      ),
    );
  }
}