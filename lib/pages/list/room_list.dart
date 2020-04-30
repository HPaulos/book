import 'package:book/state/book_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../widgets/search_widget.dart';
import 'hotels_add.dart';

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
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: SearchWidget(TextEditingController())),
              ],
            ),
            HotelsAdd(),
            Row(
              children: <Widget>[
                Center(
                  child: Text("The list "),
                )
              ],
            )
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
