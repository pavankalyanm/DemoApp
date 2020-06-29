import 'package:flutter/material.dart';
import 'package:login/screens/product.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Product(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MYMART'),
        leading: IconButton(
        icon: Icon(
        Icons.menu,
        semanticLabel: 'menu',
       ),
       onPressed: () {
        print('Menu button');
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
             onPressed: (){
               print("search");
             }
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'tune',
          ),
             onPressed: (){
               print("tune");
             }
        )
      ],
     ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0/9.0,
          children: <Widget>[ Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 18.0 / 11.0,
          child: Image.asset('assets/images/shirt.jpg'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('shirt'),
              SizedBox(height: 8.0),
              Text('mens shirts'),
            ],
          ),
        ),
      ],
    ),
          )],
        ),
      
    );
  }
}



  