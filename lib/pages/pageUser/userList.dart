import 'package:flutter/material.dart';
import 'package:fonctionnalite_esport_voyages/Models/user.dart';
import 'package:fonctionnalite_esport_voyages/service/database.dart';
import 'package:provider/provider.dart';
import '../../service/authentificationService.dart';

class UserList extends StatefulWidget {


  @override
  State<UserList> createState() => _UserListState();
}
class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {


    ///VOIR COMMENT FAIRE POUR AFFICHER SEULEMENT L'UTILISATEUR CONNECTER ET NON TOUT LES UTILISATEUR
    ///genre passer par l'uid et afiicher le profil par l'uid


    final users = Provider.of<List<AppUserData>>(context);
    return ListView.builder(
        itemCount:users.length,
        itemBuilder: (context, index) {
          return UserTile(users[index]);
        },
    );
  }
}

class UserTile extends StatelessWidget {

  final AppUserData user;
  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppUser?>(context);
    if (currentUser == null) throw Exception("current user not found");
    return GestureDetector(
            child: Padding(padding: const EdgeInsets.only(top: 8.0),
                  child: Card(
                    margin: const EdgeInsets.only(top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
                      child: ListTile(
                      title: Text('${user.nom} ${user.prenom}' ),
                      subtitle: Text('${user.adresse} ${user.ville}' ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        child:  Text(user.age, style: const TextStyle(color: Colors.white),),
                      ),
                        onTap: () {
                        Navigator.pushNamed(context, '/update');
                        },
                      ),
                  ),
            ),
        );
  }
}

