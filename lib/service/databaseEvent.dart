

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fonctionnalite_esport_voyages/Models/reservationData.dart';


class DatabaseServiceEvent {
  final String uid;

  DatabaseServiceEvent({ required this.uid});

  final CollectionReference<Map<String, dynamic>> eventCollection =
  FirebaseFirestore.instance.collection("évenement");

  Future<void> saveEvent(String nom, String description, String adresse, String ville) async {
    return await eventCollection.doc(uid).set({ 'nom': nom, 'description' : description, 'adresse' : adresse, 'ville': ville });
  }

  Future<void> deleteEvent() async{
    await eventCollection.doc(uid).delete();
  }

  Future<void> updateEvent(String nom, String description, String adresse, String ville) async{
    await eventCollection.doc(uid).update({'nom' : nom, 'description' : description, 'adresse' : adresse, 'ville': ville});
  }


  ReservationEventData _eventFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return ReservationEventData(
      uid: uid,
      nom: snapshot.data()!['nom'],
      description: snapshot.data()!['description'],
      adresse: snapshot.data()!['adresse'],
      ville: snapshot.data()!['ville'],
    );
  }

  Stream<ReservationEventData> get event {
    return eventCollection.doc(uid).snapshots().map(_eventFromSnapshot);
  }

  List<ReservationEventData> _eventListFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _eventFromSnapshot(doc);
    }).toList();
  }

  Stream<List<ReservationEventData>> get events {
    return eventCollection.snapshots().map(_eventListFromSnapshot);
  }
}
