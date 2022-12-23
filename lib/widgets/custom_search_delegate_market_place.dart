import 'package:flutter/material.dart';
import 'package:hermes_marketplace/logic/search_delegate_logic.dart';
import 'package:hermes_marketplace/pages/product_display_page.dart';

class MySearchDelegateMarketPlace extends SearchDelegate {
  int indexValue = 0;
  final List _list = SearchDelegateLogic.getSearchItemsCollection();

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear)
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back)
  );

  @override
  Widget buildResults(BuildContext context) => _list.isNotEmpty
      ? ListTile(
    leading: Image.network(_list[indexValue].networkImage[0]),
    title: Text(_list[indexValue].name , maxLines: 2, overflow: TextOverflow.ellipsis,),
    subtitle: Text(_list[indexValue].price.toString()),
    onTap: (){
      // go to the relevant page, view item
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDisplay(product: _list[indexValue])));
    },

  )
      : ListTile(title: Center(child: Text('Could not find $query'),),);

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestions = _list.where((element) {
      final itemNameComparison = element.name.toLowerCase();
      final input = query.toLowerCase();
      return itemNameComparison.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context , index) {
        if (suggestions.isEmpty) {
          return const Center(child: CircularProgressIndicator(),);
        }else{
          return ListTile(
            leading: Image.network(suggestions[index].image),
            title: Text(suggestions[index].name , maxLines: 2, overflow: TextOverflow.ellipsis,),
            subtitle: Text(suggestions[index].price.toString()),
            onTap: () {
              query = suggestions[index].name;
              showResults(context);
            },
          );
        }
      },
      itemCount: suggestions.length,
    );
  }

}