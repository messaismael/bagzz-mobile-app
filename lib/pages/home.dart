import 'package:flutter/material.dart';
import 'package:flutter_app_layout/pages/cart_view.dart';
import 'package:flutter_app_layout/pages/favorite.dart';
import 'package:flutter_app_layout/pages/search.dart';
import 'package:flutter_app_layout/widgets/bottom_navbar.dart';
import 'package:flutter_app_layout/widgets/carousel_slider.dart';
import 'package:flutter_app_layout/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _index= 0;
  void _ontapBottomNav(int val){
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
              Expanded(
                child: CarouselWidget()
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 60.0),
            child: ProductList()
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
          Padding(padding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
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
            )
          ),
        ],
      ),
      body: Stack(
        children:[
         _children[_index],
          Positioned(
            left: 10,
            right: 10,
            bottom: 0,
            child: BottomNavBar(_index, _ontapBottomNav)
          ),
        ]
      )
    );
  }
}