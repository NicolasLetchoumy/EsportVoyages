import 'package:firebase_auth/firebase_auth.dart';
import 'package:fonctionnalite_esport_voyages/Models/user.dart';
import 'package:fonctionnalite_esport_voyages/service/database.dart';

class AuthentificationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // cette partie du tuto a revoir et a comprendre

  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }



  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
        await auth.signInWithEmailAndPassword(email:email , password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch(exception){
      print(exception.toString());
      return null;
    }
  }


  Future registerWithEmailAndPassword(String name, String prenom, String age, String adresse, String ville,  String email, String password) async {
    try {
      UserCredential result =
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user!= null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseService(uid:user.uid).saveUser(name, prenom, age, adresse, ville);
        return _userFromFirebaseUser(user);
      }

    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }


  Future signOut() async{
    try{
      return await auth.signOut();
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }



  // demander a ben comment faire la ré authentification pour pouvoir modifier l'email et mot de passe

  Future updateEmail(String email) async{
    try{
      auth.currentUser?.updateEmail(email);
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }


  Future reco (String email, String password) async{
    try{
      await auth.currentUser!.reauthenticateWithCredential(EmailAuthProvider.credential(email: email, password: password));
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }

// Future update(String email, String password) async{
//     try{
//       auth.currentUser?.updateEmail(email);
//       auth.currentUser?.updatePassword(password);
//     }catch(exception){
//       print(exception.toString());
//       return null;
//     }
//   }



  Future updateMdp(String password) async{
    try{
      auth.currentUser?.updatePassword(password);
    }catch(exception){
      print(exception.toString());
      return null;
    }
  }



  Future deleteUser() async{
    auth.currentUser?.delete();
  }
}