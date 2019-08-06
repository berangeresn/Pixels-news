import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(
      String data,
      {textAlign : TextAlign.center,
        color: Colors.black54,
        fontSize: 15.0,
        fontStyle: FontStyle.normal,
        familyFont: ''}) :
        super(
          data,
          textAlign : textAlign,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontStyle: fontStyle
          )
  );
}