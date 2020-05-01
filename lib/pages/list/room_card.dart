import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  height: 160,
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
                  height: 160,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  "Hotel Name trying longer text",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(primarySwatchColorCode),
                                      fontFamily: "FredokaOne",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.green,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: const Text(
                                  "Bahir Dar",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                child: Text(
                                  "10 minutes from Downtown",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ServiceIcon(FontAwesomeIcons.cocktail, "Bar"),
                              ServiceIcon(FontAwesomeIcons.shower, "Shower"),
                              ServiceIcon(
                                  FontAwesomeIcons.utensils, 'Restaurant'),
                              ServiceIcon(
                                  FontAwesomeIcons.shuttleVan, "Shuttle"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 7),
                                child: Icon(
                                  FontAwesomeIcons.moneyBill,
                                  color: Colors.green,
                                  size: 16,
                                ),
                              ),
                              Text(
                                "nightly rate ",
                                style: TextStyle(
                                  fontFamily: "NotoSerif",
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "120 ",
                                style: TextStyle(
                                    fontFamily: "NotoSerif",
                                    fontSize: 16,
                                    color: Colors.green),
                              ),
                              Text(
                                "(150 Br)",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  const ServiceIcon(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 12,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}
