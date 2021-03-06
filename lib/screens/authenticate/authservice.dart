import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/models/user.dart';

class Authservice{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
      return user != null ? User(uid:user.uid):null;
    }
//listener
Stream<User> get user{
  return _auth.onAuthStateChanged
  .map(_userFromFirebaseUser);
}

  //signin
Future signInWithEmailAndPassword(String email , String password) async{
  try{
    AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user=result.user;
    return _userFromFirebaseUser(user); 
  
  }catch(e){
     print(e.toString());
     return null;
  }

}

//register
Future registerWithEmailAndPassword(String email , String password) async{
  try{
    AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user=result.user;
    return _userFromFirebaseUser(user); 
  
  }catch(e){
     print(e.toString());
     return null;
  }

}

//signout

Future signOut() async{
  try{
    return await _auth.signOut(); 
  }catch(e){
     print(e.toString());
     return null;
  }
}

  }
  
 