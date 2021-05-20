import 'package:flutter/material.dart';
import 'package:flutter_app_layout/widgets/product_card.dart';

import '../mockData.dart';

class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GridView.extent(
      physics: new NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      maxCrossAxisExtent: 170.0,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 0.55,/*The key is the childAspectRatio. This value is use to determine the layout in GridView. In order to get the desired aspect you have to set it to the (itemWidth / itemHeight)*/ 
      children: <Widget>[
        for(var product in products)
          ProductCard(name: product.name, imageUrl: product.picture),
      ]
    );
  }
}
