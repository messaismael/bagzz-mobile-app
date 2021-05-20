import 'package:flutter/material.dart';

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