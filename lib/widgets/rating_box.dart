import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        rating >= 1
          ? Icon(Icons.star, size: _size, color: Colors.yellow.shade800)
          : rating >= 0.5 ? Icon(Icons.star_half, size: _size, color: Colors.yellow.shade800)
          : Icon(Icons.star_border, size: _size, color: Colors.yellow.shade800),
        rating >= 2
          ? Icon(Icons.star, size: _size, color: Colors.yellow.shade800)
          : rating >= 1.5 ? Icon(Icons.star_half, size: _size, color: Colors.yellow.shade800)
          : Icon(Icons.star_border, size: _size, color: Colors.yellow.shade800),
        rating >= 3
          ? Icon(Icons.star, size: _size, color: Colors.yellow.shade800)
          : rating >= 2.5 ? Icon(Icons.star_half, size: _size, color: Colors.yellow.shade800)
          : Icon(Icons.star_border, size: _size, color: Colors.yellow.shade800),
        rating >= 4
          ? Icon(Icons.star, size: _size, color: Colors.yellow.shade800)
          : rating == 3.5 ? Icon(Icons.star_half, size: _size, color: Colors.yellow.shade800)
          : Icon(Icons.star_border, size: _size, color: Colors.yellow.shade800),
        rating >= 5
          ? Icon(Icons.star, size: _size, color: Colors.yellow.shade800)
          : rating == 4.5 ? Icon(Icons.star_half, size: _size, color: Colors.yellow.shade800)
          : Icon(Icons.star_border, size: _size, color: Colors.yellow.shade800),
      ]
    );
  }
}