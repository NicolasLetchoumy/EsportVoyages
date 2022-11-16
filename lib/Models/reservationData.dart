class ReservationEvent{
  final String uid;

  ReservationEvent({ required this.uid});

}



///création d'une classe ReservationData
class ReservationEventData{
  final String uid;
  final String nom;
  final String description;
  final String adresse;
  final String ville;



  ///CONSTRUCTEUR de la classe

  ReservationEventData({
    required this.uid,
    required this.nom,
    required this.description,
    required this.adresse,
    required this.ville
  });
}