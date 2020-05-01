import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/book_theme.dart';

class RoomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primarySwatchColorCode =
        Provider.of<BookThemeProvider>(context).primarySwatchColorCode;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
          ),
        ],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
      ),
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(
                            "https://thumbnails.trvl-media.com/HsHU3K1Kinj19aiK4AqSftniXco=/773x530/smart/filters:quality(60)/images.trvl-media.com/hotels/3000000/2240000/2238900/2238808/f1dcff79_z.jpg"),
                        fit: BoxFit.fill),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(12)),
                  ),
                  child: Column(
                    children: const <Widget>[],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
