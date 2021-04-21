import 'package:flutter/material.dart';

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
                      'assets/images/avaatar.png',
                      width: 35.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: ProductCard(name: "Artsy", imageUrl:"assets/images/artsy.png" ,),
        ));
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
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 169,
        margin: EdgeInsets.only(top:20),
        padding: EdgeInsets.only(top: 5, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          color: Color(0xFFF1F1F1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left:10, right: 0),
                //color: Colors.grey[500],
                child: Image.asset(
                  widget.imageUrl,
                  width: 111,
                  height: 111,
                )
              ),
              Icon(Icons.favorite, size: 17,color: Colors.redAccent)
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom:15, top:10),
            child: Text(
              widget.name, 
              style: TextStyle( 
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)
            )),
          Container(
            padding: EdgeInsets.only(bottom: 0 , left:8, right:8 ),
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
    );
  }
}
