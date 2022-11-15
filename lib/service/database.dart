

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fonctionnalite_esport_voyages/Models/user.dart';


class DatabaseService {
  final String uid;

  DatabaseService({ required this.uid});

  final CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection("utilisateurs");

  Future<void> saveUser(String nom, String prenom, String age, String adresse, String ville) async {
    return await userCollection.doc(uid).set({ 'nom': nom, 'prenom' : prenom, 'age' : age, 'adresse' : adresse, 'ville': ville });
  }

  Future<void> deleteUser() async{
     await userCollection.doc(uid).delete();
  }

  Future<void> updateUser(String nom, String prenom, String age, String adresse, String ville) async{
     await userCollection.doc(uid).update({'nom' : nom, 'prenom' : prenom, 'age' : age, 'adresse' : adresse, 'ville': ville});
  }



  AppUserData _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return AppUserData(
      uid: uid,
      nom: snapshot.data()!['nom'],
      prenom: snapshot.data()!['prenom'],
      age: snapshot.data()!['age'],
      adresse: snapshot.data()!['adresse'],
      ville: snapshot.data()!['ville'],
    );
  }

  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  List<AppUserData> _userListFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  Stream<List<AppUserData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }


}
