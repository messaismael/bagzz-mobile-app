import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String cover;

  const CategoryCard({Key key, this.name, this.cover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(children: [
        Container(
            height: double.infinity,
            child: Image.asset(
              this.cover,
              fit: BoxFit.contain,
            ))
      ]),
    );
  }
}
