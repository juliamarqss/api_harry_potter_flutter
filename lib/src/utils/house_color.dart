import 'package:flutter/material.dart';

Color HouseColor(String house) {
  switch (house) {
    case "Gryffindor":
      return Colors.red;
    case "Slytherin":
      return Colors.green;
    case "Ravenclaw":
      return Colors.blue;
    case "Hufflepuff":
      return Colors.amber;
    default:
      return Colors.black;
  }
}
