import 'package:flutter/material.dart';
import 'mockData.dart';
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
        body:  Container(
          padding: EdgeInsets.all(10.0),
          child:ProductList() //(name: "Artsy", imageUrl: "assets/images/artsy.png",),
        )
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
          maxCrossAxisExtent: 170.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: orientation == Orientation.portrait? widthScreen/heightScreen:heightScreen/widthScreen, /*The key is the childAspectRatio. This value is use to determine the layout in GridView. In order to get the desired aspect you have to set it to the (itemWidth / itemHeight)*/ 
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
            child: GestureDetector( onTap:  _onFavorite,
              child: Icon( _favorite? Icons.favorite: Icons.favorite_border,
                size: 24,
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
