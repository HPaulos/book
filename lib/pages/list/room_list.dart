import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../widgets/search_widget.dart';
import 'hotels_ad.dart';
import 'room_card.dart';

class RoomsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        leading: Icon(FontAwesomeIcons.hotel),
        actions: const <Widget>[],
        title: const Text("Hotel Rooms"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: SearchWidget(TextEditingController())),
              ],
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              if (index == 0) {
                return HotelsAd();
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: RoomCard(),
              );
            }))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.hotel,
            ),
            title: const Text('Rooms'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.history),
            title: const Text('Activities'),
          ),
        ],
      ),
    );
  }
}
