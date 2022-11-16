import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fonctionnalite_esport_voyages/pages/accueilVisite.dart';
import 'package:fonctionnalite_esport_voyages/pages/pageUser/delete.dart';
import 'package:fonctionnalite_esport_voyages/pages/pageUser/readuser.dart';
import 'package:fonctionnalite_esport_voyages/pages/pageLogger/splashScreen_wrapper.dart';
import 'package:fonctionnalite_esport_voyages/pages/pageUser/update.dart';
import 'package:fonctionnalite_esport_voyages/service/authentificationService.dart';
import 'package:provider/provider.dart';
import 'Models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCPQBSZiNVdRQhjHiDfDTaphvJTgoNETXs",
            appId: "1:720288216836:web:f7d283bbc89fd5bad80251",
            authDomain: "fonctionnalite-esport-voyages.firebaseapp.com",
            messagingSenderId: "720288216836",
            projectId: "fonctionnalite-esport-voyages",
            storageBucket: "fonctionnalite-esport-voyages.appspot.com")
    );
  } else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthentificationService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (context) => const AccueilVisite());
      case '/logger' :
        return MaterialPageRoute(builder: (context) => const SplashScreenWrapper());
      case '/update' :
        return MaterialPageRoute(builder: (context) => const UpdateUser());
      case '/readuser' :
        return MaterialPageRoute(builder: (context) => const ReadUser());
      case '/delete' :
        return MaterialPageRoute(builder: (context) => const DeleteUser());



      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) =>
            Scaffold(
                appBar: AppBar(title: const Text("Error"), centerTitle: true),
                body: const Center(
                  child:  Text("Page not found"),
                )
            )
    );
  }
}