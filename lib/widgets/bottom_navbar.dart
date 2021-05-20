import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  final int currentIndex;
  final void Function(int) ontapped;

  BottomNavBar(this.currentIndex, this.ontapped);

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