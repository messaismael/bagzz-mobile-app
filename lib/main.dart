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
        primarySwatch: Colors.blueGrey,
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
      appBar: AppBar(
        title: Text("Fashion Style"),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: Icon(Icons.menu),  
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
            child: GestureDetector(
              onTap: () {},
              child: ElevatedButton(
                onPressed: null,
                child: Text("Cart"), 
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(Colors.lime[50]),
                ),
              ),
            )
          ),
        ],
      ),
      body: Center(
        child:Text('You have pushed the button this many times:',)
      ),
    );
  }
}
