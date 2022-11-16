import 'package:flutter/material.dart';
import 'package:fonctionnalite_esport_voyages/Models/user.dart';
import 'package:fonctionnalite_esport_voyages/pages/miseEnPlaceListeBdd/userList.dart';
import 'package:fonctionnalite_esport_voyages/service/database.dart';
import 'package:provider/provider.dart';
import '../../service/authentificationService.dart';

class ReadUser extends StatefulWidget {
  const ReadUser({Key? key}) : super(key: key);

  @override
  State<ReadUser> createState() => _ReadUserState();
}

class _ReadUserState extends State<ReadUser> {

  final AuthentificationService auth = AuthentificationService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) throw Exception("user not found");
    final database = DatabaseService(uid: user.uid);
    return StreamProvider<List<AppUserData>>.value(
      initialData: [],
      value: database.users,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Mon espace'),
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
          body: UserList(),
      ),
    );
  }
}
