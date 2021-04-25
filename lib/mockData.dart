class Product {
  final String name;
  final String picture;
  final String price;

  Product(this.name, this.picture, this.price);
}

final List<Map<String, Object>> _heroItems = [
  {
    "description": "This season's latest",
    "picture": "assets/images/heroImg.png",
    "piece-number": 50,
    "type": "clothing"
  },
  /*{
    "description": "This season's latest",
    "picture": "/assets/images/heroImg.png",
    "piece-number": 50,
    "type": "clothing"
  }*/
];

final products  = _productList.map((i)=> Product(i["name"], i["picture"], i["price"])).toList(growable: false);

final List<Map<String, Object>> _productList = [
  {
    "name": "Artsy",
    "picture": "assets/images/artsy.png",
    "piece-number": 50,
    "type": "clothing",
    "price": "\$ 30",
  },
  {
    "name": "Berkely",
    "picture": "assets/images/berkely.png",
    "piece-number": 50,
    "type": "clothing",
    "price":"\$ 50",

  },
  {
    "name": "Canucinus",
    "picture": "assets/images/canucinus.png",
    "piece-number": 50,
    "type": "clothing",
    "price":"\$ 80",
  },
  {
    "name": "Monogram",
    "picture": "assets/images/monogram.png",
    "piece-number": 50,
    "type": "clothing",
    "price":"\$ 10",

  },
];
