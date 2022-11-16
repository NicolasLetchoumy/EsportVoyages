import 'package:flutter/material.dart';
import '../../service/authentificationService.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {

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
              
            ],
          ),
        )
    );
  }
}
