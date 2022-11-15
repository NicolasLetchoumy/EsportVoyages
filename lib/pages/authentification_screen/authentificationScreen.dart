import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../common/constant.dart';
import '../../service/authentificationService.dart';

class authentificationScreen extends StatefulWidget {



  @override
  State<authentificationScreen> createState() => authentificationScreenState();
}

class authentificationScreenState extends State<authentificationScreen> {

  final AuthentificationService auth = AuthentificationService();
  final formKey = GlobalKey<FormState>();
  String error = '';
  bool showSignIn = true;

  final controllerEmail = TextEditingController();
  final controllerMdp = TextEditingController();
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerAdresse = TextEditingController();
  final controllerVille = TextEditingController();
  final controllerPrenom = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerMdp.dispose();
    controllerName.dispose();
    controllerAge.dispose();
    controllerAdresse.dispose();
    controllerVille.dispose();
    controllerPrenom.dispose();
    super.dispose();
  }

  void toggleView(){
    setState(() {
      formKey.currentState!.reset();
      error = '';
      controllerMdp.text = '';
      controllerEmail.text = '' ;
      controllerName.text = '' ;
      controllerAge.text = '';
      controllerAdresse.text = '' ;
      controllerVille.text = '' ;
      controllerPrenom.text = '' ;
      showSignIn = !showSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(showSignIn ? 'logger vous ' : 'inscrivez vous'),
        actions: <Widget> [
          TextButton.icon(onPressed: () => toggleView(),
            icon: const Icon(Icons.person, color: Colors.white,),
            label: Text(showSignIn ? 'register': 'sign in', style: const TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
        key: formKey,
        child: Column(
        children: [
          !showSignIn ? TextFormField(
            controller: controllerName ,
            validator: (value) => value == null || value.isEmpty ? "Enter a nom" : null,
            decoration: textInputDecoration.copyWith(hintText: 'Nom'),
          )  : Container(),
          !showSignIn ? const SizedBox(height: 24,) : Container(),

          !showSignIn ? TextFormField(
            controller: controllerPrenom ,
            validator: (value) => value == null || value.isEmpty ? "Enter a Prenom" : null,
            decoration: textInputDecoration.copyWith(hintText: 'Prenom'),
          ) : Container(),
          !showSignIn ? const SizedBox(height: 24,) : Container(),

          !showSignIn ? TextFormField(
            controller: controllerAge ,
            validator: (value) => value == null || value.isEmpty ? "Enter a Age" : null,
            decoration: textInputDecoration.copyWith(hintText: 'Age'),
          ) : Container(),
          !showSignIn ? const SizedBox(height: 24,) : Container(),

          !showSignIn ? TextFormField(
            controller: controllerAdresse ,
            validator: (value) => value == null || value.isEmpty ? "Enter a Adresse" : null,
            decoration: textInputDecoration.copyWith(hintText: 'Adresse'),
          ): Container(),
          !showSignIn ? const SizedBox(height: 24,) : Container(),

          !showSignIn ? TextFormField(
            controller: controllerVille ,
            validator: (value) => value == null || value.isEmpty ? "Enter a Ville" : null,
            decoration: textInputDecoration.copyWith(hintText: 'Ville'),
          ): Container(),
          !showSignIn ? const SizedBox(height: 24,) : Container(),

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
              var name = controllerName.value.text;
              var adresse = controllerAdresse.value.text ;
              var prenom = controllerPrenom.value.text ;
              var age = controllerAge.value.text ;
              var ville = controllerVille.value.text ;

              dynamic result =  showSignIn
                  ? await auth.signInWithEmailAndPassword(email, password)
                  : await auth.registerWithEmailAndPassword(name, prenom, age, adresse, ville, email, password);
              if (result == null) {
                setState(() {
                  error = 'recommencer le formulaire';
                });
              }
            }
          },
              child:  Text(showSignIn ? 'sign in' : 'register',
            style: const TextStyle(color: Colors.white),)
          ),
          const SizedBox(height: 8.0),
          Text(error, style: const TextStyle(color: Colors.red, fontSize: 15),)
        ],
      ),
    ),),);
  }
}
