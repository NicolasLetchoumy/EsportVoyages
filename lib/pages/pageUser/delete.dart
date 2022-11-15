import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../service/authentificationService.dart';
import '../../service/database.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {

  final AuthentificationService auth = AuthentificationService();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('suprimer votre compte'),
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
              const Text('Voulez vraiment supprimer votre compte ?'),
              ElevatedButton(onPressed: () {
                DatabaseService(uid:'${auth.auth.currentUser?.uid}').deleteUser();
                AuthentificationService().deleteUser();
                Navigator.pushNamed(context, '/');
              }, child: const Text('OUI')),
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text('NON')),
            ],
          ),
        )
    );
  }
}
