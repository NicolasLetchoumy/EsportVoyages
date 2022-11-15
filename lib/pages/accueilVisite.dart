import 'package:flutter/material.dart';
import '../service/authentificationService.dart';

class AccueilVisite extends StatefulWidget {
  const AccueilVisite({Key? key}) : super(key: key);

  @override
  State<AccueilVisite> createState() => _AccueilVisiteState();
}

class _AccueilVisiteState extends State<AccueilVisite> {

  final AuthentificationService auth = AuthentificationService();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Accueil'),
          actions: <Widget> [
            TextButton.icon(onPressed: () async {
              Navigator.pushNamed(context, '/logger');
            },
              icon: const Icon(Icons.person, color: Colors.white,),
              label:  Text('connectez-vous',style: const TextStyle(color: Colors.white),),
            )
          ],
        ),
        body: Center(
          child :Column(
            children: [
              Row(
              children: const [
               Text('test'),

              ],
            ),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/logger');
              }, child: const Text('connectez-vous')),
            ],
          ),
        )
    );
  }
}
