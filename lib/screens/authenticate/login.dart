import 'package:flutter/material.dart';
import 'package:login/screens/Animation/FadeAnimation.dart';
import 'package:login/screens/authenticate/authservice.dart';
import 'package:login/screens/authenticate/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  
  final Function widview;
  Login({this.widview});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final Authservice _auth = Authservice();
   final _formKey=GlobalKey<FormState>();
    String error="";
    String email="";
    String password="";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
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
                  FadeAnimation(1.5, Text("Login", style: TextStyle(color: Color.fromRGBO(49, 39, 79, 1), fontWeight: FontWeight.bold, fontSize: 30),)),
                  SizedBox(height: 30,),
                  FadeAnimation(1.7, Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(196, 135, 198, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]
                    ),
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
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                            validator:(val)=> val.isEmpty? "enter username":null ,
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
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.7, Center(child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),))),
                   SizedBox(height: 30,),
                    FadeAnimation(1.9, Container(
                   
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      
                    ),
                    child:RaisedButton(
                      
                      color: Color.fromRGBO(49, 39, 79, 1),
                    child: Center(
                      child: Text("Login", style: TextStyle(color: Colors.white),),
                    ),
                    onPressed: ()async{
                      if (_formKey.currentState.validate()) {
                         dynamic result= await _auth.signInWithEmailAndPassword(email, password);
                         if (result==null){
                           setState(()=>error ="could not sign in " 
                             
                           );
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
                        MaterialPageRoute(builder: (context)=>Signup())
                        );
                      },
                    child: Text("Create Account", 
                    style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)
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
