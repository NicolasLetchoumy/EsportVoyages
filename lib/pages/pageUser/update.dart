import 'package:flutter/material.dart';
import '../../common/constant.dart';
import '../../service/authentificationService.dart';
import '../../service/database.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {

  final AuthentificationService auth = AuthentificationService();

  final formKey = GlobalKey<FormState>();
  String error = '';


  final controllerEmail = TextEditingController();
  final controllerMdp = TextEditingController();
  final controllerName = TextEditingController();
  final controllerPrenom = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerAdresse = TextEditingController();
  final controllerVille = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerMdp.dispose();
    controllerName.dispose();
    controllerPrenom.dispose();
    controllerAge.dispose();
    controllerAdresse.dispose();
    controllerVille.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mise a jour'),
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
              controller: controllerName ,
              validator: (value) =>  value != null && value.isEmpty ? "Enter a nom" : null,
              decoration: textInputDecoration.copyWith(hintText: 'nom'),
            ),const SizedBox(height: 24,),
              TextFormField(
              controller: controllerPrenom ,
              validator: (value) =>  value != null && value.isEmpty ? "Enter a prenom" : null,
              decoration: textInputDecoration.copyWith(hintText: 'prenom'),
            ),const SizedBox(height: 24,),
              TextFormField(
              controller: controllerAge ,
              validator: (value) =>  value != null && value.isEmpty ? "Enter a age" : null,
              decoration: textInputDecoration.copyWith(hintText: 'age'),
            ),const SizedBox(height: 24,),
              TextFormField(
              controller: controllerAdresse,
              validator: (value) =>  value != null && value.isEmpty ? "Enter a adresse" : null,
              decoration: textInputDecoration.copyWith(hintText: 'adresse'),
            ),const SizedBox(height: 24,),
              TextFormField(
                controller: controllerVille ,
                validator: (value) =>  value != null && value.isEmpty ? "Enter a ville" : null,
                decoration: textInputDecoration.copyWith(hintText: 'ville'),
              ),const SizedBox(height: 24,),
              TextFormField(
                controller: controllerEmail ,
                validator: (value) => value == null || value.isEmpty ? "Enter a Email" : null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
              ), const SizedBox(height: 24,),
              TextFormField(

                controller: controllerMdp ,
                obscureText: true,
                validator: (value) =>  value != null && value.length < 6 ? "entrer votre mot de passe" : null,
                decoration: textInputDecoration.copyWith(hintText: 'Mot de passe'),
              ),const SizedBox(height: 24,),
              ElevatedButton(onPressed: () async {
                if (formKey.currentState!.validate() == true) {
                  var email = controllerEmail.value.text;
                  var password = controllerMdp.value.text;
                  var nom = controllerName.value.text;
                  var prenom = controllerPrenom.value.text;
                  var age = controllerAge.value.text;
                  var adresse = controllerAdresse.value.text;
                  var ville = controllerVille.value.text;
                  // regarder comment récupéré l'ancien mot de passe du currrentUser


                  DatabaseService(uid:'${auth.auth.currentUser?.uid}').updateUser(nom, prenom, age, adresse, ville);

                  // VOIR AVEC BEN RE AUTHENTIFICATION

                  // AuthentificationService().reco(currentEmail!, password);
                   AuthentificationService().updateEmail(email);
                   AuthentificationService().updateMdp(password);


                 // AuthentificationService().update(email, password);
                  Navigator.pop(context);
                }
              },
                  child:  const Text( 'update',
                    style: TextStyle(color: Colors.white),)
              ),
              const SizedBox(height: 8.0),
              Text(error, style: const TextStyle(color: Colors.red, fontSize: 15),)
            ],
          ),
        ),),
    );
  }
}
