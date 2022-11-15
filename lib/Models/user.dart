class AppUser{
  final String uid;

  AppUser({ required this.uid});

}



///création d'une classe userData
class AppUserData{
  final String uid;
  final String nom;
  final String prenom;
  final String age;
  final String adresse;
  final String ville;



  ///CONSTRUCTEUR de la classe

  AppUserData({
    required this.uid,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.adresse,
    required this.ville
  });
}