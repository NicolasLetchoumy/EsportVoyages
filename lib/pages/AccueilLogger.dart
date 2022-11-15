import 'package:flutter/material.dart';
import '../service/authentificationService.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  final AuthentificationService auth = AuthentificationService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Accueil'),
          actions: <Widget> [
            TextButton.icon(onPressed: () async {
              await auth.signOut();
              Navigator.pushNamed(context, '/');
            },
              icon: const Icon(Icons.person, color: Colors.white,),
              label:  Text('${auth.auth.currentUser?.email}',style: const TextStyle(color: Colors.white),),
            )
          ],
        ),
        body: Center(
          child :Column(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/readuser');
              }, child: const Text('afficher votre profil')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/update');
              }, child: const Text('modifier votre profil')),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/delete');
              }, child: const Text('supprimer votre profil')),
            ],
        ),
        )
      );
  }
}
