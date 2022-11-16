import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/reservationData.dart';
import '../../service/authentificationService.dart';
import '../../service/databaseEvent.dart';
import '../miseEnPlaceListeBdd/eventList.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {

  final AuthentificationService auth = AuthentificationService();

  @override
  Widget build(BuildContext context) {

    final event = Provider.of<ReservationEvent>(context);
  //  if (event == null) throw Exception("Event not found");
    final database = DatabaseServiceEvent(uid: event.uid);
    return StreamProvider<List<ReservationEventData>>.value(
      initialData: [],
      value: database.events,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ma réservation'),
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
        body: EventList(),
      ),
    );
  }
}
