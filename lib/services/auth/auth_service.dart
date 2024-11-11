
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

final _auth=FirebaseAuth.instance;

User ?  getCurrentUser ()=> _auth.currentUser;
String getCurrentUid ()=> _auth.currentUser!.uid;

Future<UserCredential> loginEmailPassword(String email,password)async{

  try{
    final UserCredential =await _auth.signInWithEmailAndPassword(email: email, password: password);
    return UserCredential;
  }
  on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}

Future<UserCredential>registerEmailPassword(String email,password)async{
  try{
    UserCredential userCredential= await _auth .createUserWithEmailAndPassword(
        email: email,
        password: password);
    return userCredential;
  }on FirebaseAuthException catch (e){
    throw Exception(e.code);
  }

}

Future<void>logout()async{
  await _auth.signOut();
}

}
