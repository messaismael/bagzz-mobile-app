import 'package:flutter/material.dart';

class SearchProducts extends StatelessWidget {
  List<String> _result = [
    "Artsy black sling bag",
    "Berkely sling bag",
    "Sling bag color"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(/* border: Border.all(color: Colors.redAccent) */),
      child: Container(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              alignment: AlignmentDirectional.centerEnd,
              child: GestureDetector(
                child: Icon(
                  Icons.close,
                  size: 27,
                ),
                onTap: () {},
              )),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1.2))),
              child: TextField(
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    hintText: 'Type here to search', border: InputBorder.none),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          for (var item in _result)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                item,
                style: TextStyle(fontSize: 22),
              ),
            ),
        ]),
      ),
    );
  }
}
