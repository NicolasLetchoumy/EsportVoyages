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
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row( children: const [
            Padding( padding: EdgeInsets.all(15), child: Text('Accueil', style: TextStyle(color: Colors.black),),),
            Text('EsportVoyages', style: TextStyle(color: Colors.black),) ]),
            centerTitle: true,
          leading: Image.asset('assets/images/esportvoyages_logo_536477.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          actions: <Widget> [
            TextButton.icon(onPressed: () async {
              Navigator.pushNamed(context, '/logger');
            },
              icon: const Icon(Icons.person, color: Colors.blue,),
              label:  const Text('connectez-vous',style: TextStyle(color: Colors.blue),),
            ),
          ],
        ),
        body: Center(
          child :Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: const  [
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
