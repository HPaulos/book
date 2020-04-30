import 'package:book/models/city.dart';
import '../services/cities.dart';
import 'package:flutter/material.dart';

class CitiesListProvider extends ChangeNotifier {
  Future<List<City>> get getCities => CitiesService.getCities();
}
