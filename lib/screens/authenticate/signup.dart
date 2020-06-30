import 'package:flutter/material.dart';
import 'package:login/screens/Animation/FadeAnimation.dart';
import 'package:login/screens/authenticate/login.dart';
import 'package:login/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/screens/authenticate/authservice.dart';
import 'package:login/shared/loading.dart';

class Signup extends StatefulWidget {
  final Function widview;
  Signup({this.widview});
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey=GlobalKey<FormState>();
  final Authservice _auth = Authservice();
  
  String fname="";
  String lname="";
  String error="";
  String email="";
  String password="";
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
  return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 80,
                    height: 150,
                    width: 250,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/signup.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1.5, Text("Signup", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 30),)),
                  SizedBox(height: 30,),
                  FadeAnimation(1.7, Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan[100],
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                      children: <Widget>[       
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.grey[200]
                            ))
                          ),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Firstname",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            validator:(val)=> val.isEmpty? "enter firstname":null ,
                            onChanged: (val){
                              setState(()=>fname=val);
                            },
                          
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.grey[200]
                            ))
                          ),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Lastname",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            validator:(val)=> val.isEmpty? "enter lastname":null ,
                            onChanged: (val){
                              setState(()=>lname=val);
                            },
                          
                          
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: Colors.grey[200]
                            ))
                          ),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            validator:(val)=> val.isEmpty? "enter Email":null ,
                            onChanged: (val){
                              setState(()=>email=val);
                            },
                          
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator:(val)=> val.length<6?"password must be atleast 6 char":null ,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            onChanged: (val){
                              setState(()=>password=val);
                            },
                          ),
                        )
                      ],
                    ),
                    ),
                  )),
                 
                   SizedBox(height: 30,),
                    FadeAnimation(1.9, Container(
                   
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      
                    ),
                    child:RaisedButton(
                      
                      color: Colors.cyan,
                    child: Center(
                      child: Text("REGISTER", style: TextStyle(color: Colors.white),),
                    ),
                    onPressed: ()async{
                      if (_formKey.currentState.validate()) {
                        
                          
                        
                         dynamic result = await _auth.registerWithEmailAndPassword(email, password );
                        
                         if(result==null){
                           setState((){
                             error ="please supply valid email" ;
                             loading=false;
                           }
                           );
                         }else{
                            setState(() {
                             Navigator.push(context, 
                             MaterialPageRoute(builder: (context)=>Login())
                           );
                        });
                         }

                         
                    }
                    },
                    )
                   )),
                 SizedBox(height: 30,),
                  FadeAnimation(2, Center(
                    child:GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>Login())
                        );
                      },
                    child: Text("LOGIN", 
                    style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6),fontSize:15 
                    ),
                    )
                    ),
                    )
                    ),
                    SizedBox(height: 12.0,),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red,fontSize: 14.0),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}