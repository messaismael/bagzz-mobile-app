import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../mockData.dart';

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
