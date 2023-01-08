import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Card style
BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    boxShadow: [
      BoxShadow(
          blurRadius: 10, spreadRadius: 5, color: Colors.grey.withAlpha(70))
    ],
  );
}
