import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/city.dart';
import '../state/cities_list.dart';

@immutable
class SearchWidget extends StatefulWidget {
  const SearchWidget(this._searchController, {Key key}) : super(key: key);

  final TextEditingController _searchController;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String _citySelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(23),
      borderOnForeground: false,
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 41,
          child: _buildAutoComplete(context),
        ),
      ),
    );
  }

  // TODO(Paulos): update autocomplete to show scrollable suggetsion
  Widget _buildAutoComplete(BuildContext context) {
    return FutureBuilder<List<City>>(
        future: Provider.of<CitiesListProvider>(context).getCities,
        builder: (context, cities) {
          if (cities.hasData) {
            return AutoCompleteTextField<String>(            
                suggestionsAmount: 7,
                itemSubmitted: (text) {
                  widget._searchController.text = text;
                  _citySelected = text;
                },
                key: null,
                suggestions: cities.data.map((city) => city.name).toList(),
                itemBuilder: (context, item) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 21, vertical: 1),
                      dense: true,
                      title: Text(
                        item,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                itemSorter: (item1, item2) =>
                    item1.toLowerCase().compareTo(item2.toLowerCase()),
                itemFilter: (item, query) {
                  return item.toLowerCase().startsWith(query.toLowerCase());
                },
                clearOnSubmit: false,
                textSubmitted: (text) {},
                controller: widget._searchController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Roboto",
                ),
                decoration: InputDecoration(
                    hintText: "Where are you looking ?",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Roboto",
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          widget._searchController.clear();
                        }),
                    border: InputBorder.none));
          }

          return const LinearProgressIndicator();
        });
  }
}
