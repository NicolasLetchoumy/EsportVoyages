import 'package:flutter/material.dart';
import 'package:fonctionnalite_esport_voyages/Models/user.dart';
import 'package:provider/provider.dart';

import '../AccueilLogger.dart';
import '../authentification_screen/authentificationScreen.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null){
      return authentificationScreen();
    }else{
      return const Accueil();
    }
    return Container();
  }
}
