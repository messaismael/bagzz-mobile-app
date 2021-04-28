class Product {
  final String name;
  final String picture;
  final String price;

  Product(this.name, this.picture, this.price);
}

final List<Map<String, Object>> _heroItems = [
  {
    "description": "This season's latest",
    "picture": "assets/images/heroImg1.png",
    "price":"\$ 30"
  },
  {
    "description": "This season's latest",
    "picture": "assets/images/heroImg2.png",
    "price":"\$ 50"
    
  }
];

final heroProducts = _heroItems.map((i)=>Product(i["name"], i["picture"], i["price"])).toList(growable: false);

final products  = _productList.map((i)=> Product(i["name"], i["picture"], i["price"])).toList(growable: false);

final List<Map<String, Object>> _productList = [
  {
    "name": "Artsy",
    "picture": "assets/images/artsy.png",
    "price": "\$ 30",
  },
  {
    "name": "Berkely",
    "picture": "assets/images/berkely.png",
    "price":"\$ 50",

  },
  {
    "name": "Canucinus",
    "picture": "assets/images/canucinus.png",
    "price":"\$ 80",
  },
  {
    "name": "Monogram",
    "picture": "assets/images/monogram.png",
    "price":"\$ 10",

  },
];
