import 'dart:ffi';

import 'package:flutter/material.dart';
import 'mockData.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
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
    Container(decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)), child: Center(child: Text("Search view"),),),
    Container(decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)), child: Center(child: Text("Favorite view"),),),
    Container(decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent)),child: Center(child: Text("Cart view"),),)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "bagzz",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
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
      body:  Stack(
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


class BottomNavBar extends StatelessWidget {

  int currentIndex = 0;
  void Function(int) ontapped= (int){};

  BottomNavBar(this.currentIndex,this.ontapped);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      child:BottomNavigationBar(
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        fixedColor: Colors.blueGrey,
        unselectedItemColor: Colors.black,
        onTap: ontapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 24,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 24,),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 24,),
            label: 'Cart',
          )
        ],
      )
    );
  }
}

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              height: 205.0,
              viewportFraction: 1.0,
              ),
            items: heroProducts.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      //color: Colors.blue
                    ),
                    child: Stack(
                      alignment:Alignment.centerLeft,
                      children:[
                        Image.asset(item.picture),
                        Positioned(
                          top: 60.0,
                          right: 25.0,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Container(color:Colors.white, padding: EdgeInsets.only(left:3,), child:Text("This",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),)),
                              Container(color:Colors.white, padding: EdgeInsets.only(left:3,), child:Text("season's",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),)),
                              Container(color:Colors.white, padding: EdgeInsets.only(left:3,), child:Text("latest",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),)),
                            ]
                          )
                        ),
                      ]
                    )
                  );
                },
              );
            }).toList(),
        ),
        Positioned(
          bottom: 0,
          right: 73.0,
          child:GestureDetector(
            onTap: () => buttonCarouselController.previousPage(
              duration: Duration(milliseconds: 300), 
              curve: Curves.linear
            ),
            child: Container(
              width: 51,
              height: 51,
              color: Colors.black,
              child: Icon(Icons.arrow_back_sharp, color: Colors.white)
            ),
          )
        ),
        Positioned(
          bottom: 0,
          right: 20.0,
          child:GestureDetector(
            onTap: () => buttonCarouselController.nextPage(
              duration: Duration(milliseconds: 300), 
              curve: Curves.linear
            ),
            child: Container(
              width: 51,
              height: 51,
              color: Colors.black,
              child: Icon(Icons.arrow_forward, color: Colors.white )
            ),
          )
        )
      ]
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String name;

  ProductCard({Key key, this.name, this.imageUrl}) : super(key: key);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _favorite = false;

  void _onFavorite(){
    setState(() {
      _favorite = !_favorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:15),
      padding: EdgeInsets.only(top: 5, bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xFFF1F1F1),
      ),
      child: Stack(
          alignment: Alignment.center,
        children: [
          Positioned(
            right: 5.0,
            top: 0,
            child: GestureDetector( 
              onTap:  _onFavorite,
              child: Icon(_favorite? Icons.favorite: Icons.favorite_border,
                size: 20,
                color:_favorite? Colors.redAccent:null
              )
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset(widget.imageUrl)
              ),
              Container(
                margin: EdgeInsets.only(bottom:13, top:10),
                child: Text(
                  widget.name, 
                  style: TextStyle( 
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)
                )),
              Container(
                padding: EdgeInsets.only(left:8, right:8 ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 2.0)
                )),
                child:TextButton(
                  onPressed: () {},
                  child: Text("SHOP NOW", style: TextStyle(fontSize: 14.0,color: Colors.black, fontWeight: FontWeight.bold),)
                )
              )
            ]
          )
        ],
      )
    );
  }
}
