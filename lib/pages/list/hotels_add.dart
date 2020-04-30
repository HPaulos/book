import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/book_theme.dart';

class HotelsAdd extends StatefulWidget {
  @override
  _HotelsAddState createState() => _HotelsAddState();
}

class _HotelsAddState extends State<HotelsAdd> {
  List<HotelAddModel> hotels = [
    HotelAddModel(
        imageUrl:
            "https://ihg.scene7.com/is/image/ihg/holiday-inn-the-colony-4629618286-4x3",
        locationName: "Bahir Dar",
        name: "Hotel Selami"),
    HotelAddModel(
        imageUrl:
            "https://cache.marriott.com/marriottassets/marriott/HNLWI/hnlwi-cochere-1995-hor-wide.jpg?interpolation=progressive-bilinear&downsize=1440px:*",
        locationName: "Gonder",
        name: "Fasil Hotel"),
    HotelAddModel(
        imageUrl:
            "https://cdn4.hotelfigueroa.com/wp-content/uploads/2020/03/16173012/hotel-figueroa-iconicpool-2-1440x722.jpg",
        locationName: "Debire Birhna",
        name: "Bernos Hotel"),
    HotelAddModel(
        imageUrl:
            "https://a36c2e13a78ae1256a2f-1dc878dead8ec78a84e429cdf4c9df00.ssl.cf1.rackcdn.com/responsive/980/a36c2e13a78ae1256a2f-1dc878dead8ec78a84e429cdf4c9df00.ssl.cf1.rackcdn.com/u/park-hotel-clarke-quay/gallery-2018/Lobby-Park-Hotel-Clarke-Quay.jpg",
        locationName: "Adama",
        name: "Aba Jifar Hotel"),
    HotelAddModel(
        imageUrl:
            "https://3l7op12xuwj665r13zqtai1a-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/victorian_junior_suite_king_ocean_view_balcony_18_rbenson_SANQQ_K1VOM_1080x590.jpg",
        locationName: "Adama",
        name: "Aba Jifar Hotel"),
    HotelAddModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQURH4xWvnTAJqBrqSwExJR3ux4itdIpWRnwMfdvw8kW_odG6pO&usqp=CAU",
        name: "Aba Jifar Hotel",
        locationName: "Hawasa"),
    HotelAddModel(
        imageUrl: null, locationName: "Adama", name: "Aba Jifar Hotel"),
  ];
  ScrollController _controller;
  int direction = 1;

  @override
  void initState() {
    _controller = ScrollController();
    Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_controller.position.atEdge) {
        direction = -1 * direction;
      }

      _controller.animateTo(_controller.offset + direction * 165,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        controller: _controller,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: HotelAddCard(hotels[index]),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class HotelAddCard extends StatelessWidget {
  const HotelAddCard(this._hotel);

  final HotelAddModel _hotel;
  final String placeHolder =
      "https://www.briggshealthcare.com/briggs-qs-elbrus/img/comingsoon_300px.jpg?resizeid=20&resizeh=0&resizew=280";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 240,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                alignment: const Alignment(-.2, 0),
                image: NetworkImage(_hotel.imageUrl ?? placeHolder),
                fit: BoxFit.fill),
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
              height: 64,
              width: 160,
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 23,
                        ),
                        child: Text(
                          _hotel.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Spacer(),
                      Text(
                        _hotel.locationName ?? "Not specified",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 7,
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Color(Provider.of<BookThemeProvider>(context)
                              .primarySwatchColorCode),
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HotelAddModel {
  HotelAddModel(
      {@required this.name,
      @required this.locationName,
      @required this.imageUrl});

  String name;
  String imageUrl;
  String locationName;
}
