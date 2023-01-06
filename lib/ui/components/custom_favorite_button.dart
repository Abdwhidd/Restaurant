import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomFavoriteButton extends StatefulWidget {
  @override
  _CustomFavoriteButtonState createState() => _CustomFavoriteButtonState();
}

class _CustomFavoriteButtonState extends State<CustomFavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: isFavorite
              ? Text('Added to favorites')
              : Text('Removed from favorites'),
        ));
      },
    );
  }
}
