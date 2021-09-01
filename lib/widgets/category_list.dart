import 'package:flutter/material.dart';
import 'package:flutter_app_layout/widgets/category_card.dart';
import 'package:flutter_app_layout/widgets/product_card.dart';

import '../mockData.dart';

class CategoryGrid extends StatelessWidget {
  final List<Product> prod;

  CategoryGrid({Key key, @required this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  double itemWidth = MediaQuery.of(context).size.width;
    //double itemWidth = MediaQuery.of(context).size.height;

    return GridView.extent(
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        maxCrossAxisExtent: 170.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.75,
        /*The key is the childAspectRatio. This value is use to determine the layout in GridView. In order to get the desired aspect you have to set it to the (itemWidth / itemHeight)*/
        children: <Widget>[
          for (var product in this.prod)
            CategoryCard(name: product.name, cover: product.picture),
        ]);
  }
}
