import 'package:flutter/material.dart';
import 'package:flutter_app_layout/pages/cart_view.dart';
import 'package:flutter_app_layout/pages/favorite.dart';
import 'package:flutter_app_layout/pages/search.dart';
import 'package:flutter_app_layout/widgets/bottom_navbar.dart';
import 'package:flutter_app_layout/widgets/carousel_slider.dart';
import 'package:flutter_app_layout/widgets/category_list.dart';
import 'package:flutter_app_layout/widgets/product_list.dart';

import '../mockData.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  void _ontapBottomNav(int val) {
    setState(() {
      _index = val;
    });
  }

  final List<Widget> _children = [
    SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: CarouselWidget()),
            ],
          ),
          Container(
              margin: const EdgeInsets.all(10),
              child: ProductGrid(
                prod: products,
              )),
          Container(
            margin: EdgeInsets.all(25),
            child: OutlinedButton(
              child: Text(
                "CHECK ALL LATEST",
                style: TextStyle(fontSize: 16.0),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: BorderSide(color: Colors.black, width: 1.5),
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 8)),
              onPressed: () {},
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Text(
              'Shop by Categories',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin:
                  EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: 20),
              child: CategoryGrid(
                prod: categories,
              )),
          Container(
            margin: EdgeInsets.only(bottom: 70),
            child: OutlinedButton(
              child: Text(
                "BROWSE ALL CATEGORIES",
                style: TextStyle(fontSize: 16.0),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  side: BorderSide(color: Colors.black, width: 1),
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 8)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
    SearchProducts(),
    FavoriteProducts(),
    CartView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "bagzz",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              size: 30.0,
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/images/avatar.png",
                      width: 35.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
          ],
        ),
        body: Stack(children: [
          Center(child: _children[_index]),
          Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: BottomNavBar(_index, _ontapBottomNav)),
        ]));
  }
}
