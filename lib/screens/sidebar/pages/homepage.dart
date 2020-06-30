import 'package:flutter/material.dart';
import 'package:login/screens/product.dart';
import 'package:login/screens/sidebar/navigation_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/shared/firedata.dart';


class HomePage extends StatelessWidget with NavigationStates {
  final String name;
  final String brand;
  final String imageUrl;
  final DocumentSnapshot documentSnapshot;
  

  HomePage({
    @required  this.imageUrl,
    @required this.documentSnapshot,
    @required this.name,
    @required this.brand,
  });

  
  
  @override
  Widget build(BuildContext context) {
    StreamBuilder(
       stream: Firestore.instance.collection("cloths").snapshots(),

       
          


            builder: (context, snapshot) {
             return !snapshot.hasData
                 ? Text('PLease Wait')
                  : ListView.builder(
               itemCount: snapshot.data.documents.length,
               itemBuilder: (context, index) {
                DocumentSnapshot cloths = snapshot.data.documents[index];
                return HomePage(
              documentSnapshot: cloths,
              name: cloths['name'],
              imageUrl: cloths['imageURL'],
              brand:cloths['brand'],
              
            );
          },
        );
      },
    );
    
  return Scaffold(
        
        appBar: AppBar(title: Text("MyMART",style: TextStyle(
        color: Colors.cyan)),

        backgroundColor: Colors.white,
        centerTitle: true,

        actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
            color: Colors.cyan
          ),
             onPressed: (){
               print("search");
             }
        ),
        ],
        ),
      
    
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0/9.0,
          children: <Widget>[ Card(
              clipBehavior: Clip.antiAlias,
              child:GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>Product())
                  );
                },
              child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 18.0 / 11.0,
          child:Image.network(
          'https://firebasestorage.googleapis.com/v0/b/my-mart-28e58.appspot.com/o/shirt.jpg?alt=media&token=0afaa435-063a-45a3-a341-c073f4cd0b1d',
        ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("shirt"),
              SizedBox(height: 8.0),
              Text("wrogn"),
            ],
          ),
        ),
       ],
      ),
     ),
     )],
        ),
      
    );
  }
}

