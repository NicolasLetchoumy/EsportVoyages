import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/reservationData.dart';

class EventList extends StatefulWidget {


  @override
  State<EventList> createState() => _EventListState();
}
class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {


    ///VOIR COMMENT FAIRE POUR AFFICHER SEULEMENT L'UTILISATEUR CONNECTER ET NON TOUT LES UTILISATEUR
    ///genre passer par l'uid et afiicher le profil par l'uid


    final reservation = Provider.of<List<ReservationEventData>>(context);
    return ListView.builder(
      itemCount:reservation.length,
      itemBuilder: (context, index) {
        return ReservationTile(reservation[index]);
      },
    );
  }
}

class ReservationTile extends StatelessWidget {

  final ReservationEventData reservation;
  ReservationTile(this.reservation);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<ReservationEvent?>(context);
    if (currentUser == null) throw Exception("current user not found");
    return GestureDetector(
      child: Padding(padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: const EdgeInsets.only(top: 12.0, bottom: 6.0, left: 20.0, right: 20.0),
          child: ListTile(
            title: Text(reservation.nom),
            subtitle: Text('${reservation.description} ${reservation.adresse} ${reservation.ville}' ),
            onTap: () {

            },
          ),
        ),
      ),
    );
  }
}

