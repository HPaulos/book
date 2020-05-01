import 'package:book/state/cities_list.dart';

import 'pages/list/room_list.dart';
import 'state/book_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CitiesListProvider()),
      ChangeNotifierProvider(create: (_) => BookThemeProvider())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primarySwatchColorCode =
        Provider.of<BookThemeProvider>(context).primarySwatchColorCode;
    final primarySwatch = MyApp.createSwatch(Color(primarySwatchColorCode));
    const canvasColor = Color(0xFFE0E0E0);
    const cardColor = Colors.white;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: canvasColor,
          primarySwatch: MaterialColor(primarySwatchColorCode, primarySwatch),
          cardColor: cardColor),
      home: RoomsList(),
      routes: {"/rooms": (context) => RoomsList()},
    );
  }

  static Map<int, Color> createSwatch(Color color) {
    return {
      50: color.withOpacity(.1),
      100: color.withOpacity(.2),
      200: color.withOpacity(.3),
      300: color.withOpacity(.4),
      400: color.withOpacity(.5),
      500: color.withOpacity(.6),
      600: color.withOpacity(.7),
      700: color.withOpacity(.8),
      800: color.withOpacity(.9),
      900: color.withOpacity(1),
    };
  }
}
