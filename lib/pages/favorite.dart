import 'package:flutter/material.dart';

class FavoriteProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Center(child: Text("Favorite view"),),
    );
  }
}