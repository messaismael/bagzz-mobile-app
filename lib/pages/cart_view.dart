

import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent)),
      child: Center(child: Text("Cart view"),),
    );
  }
}