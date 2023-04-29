import 'package:flutter/material.dart';

Image plantIcon({Color? color}) {
  return Image.asset("assets/custom_images/plant.png", color: color);
}

Image essentialsIcon({Color? color, required int number}) {
  return Image.asset("assets/essentials/$number.png", color: color);
}
