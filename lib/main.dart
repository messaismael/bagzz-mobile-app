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
    )
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
         _children[0],
          Positioned(
            left: 10,
            right: 10,
            bottom: 0,
            child: bottomNavigationBar(),
          ),
        ]
      )
    );
  }
}


Widget bottomNavigationBar(){
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
    child:BottomNavigationBar(
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      fixedColor: Colors.black54,
      unselectedItemColor: Colors.black,
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
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          right: 65,
          child:GestureDetector(
            onTap: () => buttonCarouselController.previousPage(
              duration: Duration(milliseconds: 300), 
              curve: Curves.linear
            ),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.black,
              child: Icon(Icons.arrow_back_sharp, color: Colors.white)
            ),
          )
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child:GestureDetector(
            onTap: () => buttonCarouselController.nextPage(
              duration: Duration(milliseconds: 300), 
              curve: Curves.linear
            ),
            child: Container(
              width: 50,
              height: 50,
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
     var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;

    return OrientationBuilder(
      builder: (context, orientation){
        return GridView.extent(
          physics: new NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          maxCrossAxisExtent: 170.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.55,//orientation == Orientation.portrait? widthScreen/heightScreen: heightScreen/widthScreen, /*The key is the childAspectRatio. This value is use to determine the layout in GridView. In order to get the desired aspect you have to set it to the (itemWidth / itemHeight)*/ 
          children: <Widget>[
            for(var product in products)
              ProductCard(name: product.name, imageUrl: product.picture),
          ]
        );
      }
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
