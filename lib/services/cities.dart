import 'dart:convert';

import 'package:book/models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CitiesService {
  static Future<List<City>> getCities() async {
    final jsonString = await rootBundle.loadString('assets/cities.json');
    final decoded = (json.decode(jsonString) as List);
    List<City> citiesList =
        decoded.map((dynamic item) => City.fromJson(item)).toList();

    return citiesList;
  }
}
