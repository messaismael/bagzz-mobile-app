import 'package:flutter/material.dart';
import 'package:flutter_app_layout/widgets/category_card.dart';
import 'package:flutter_app_layout/widgets/product_card.dart';

import '../mockData.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> prod;
  ProductGrid({Key key, @required this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        maxCrossAxisExtent: 170.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.51,
        children: <Widget>[
          for (var product in this.prod)
            ProductCard(name: product.name, imageUrl: product.picture),
        ]);
  }
}
