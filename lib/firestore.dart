import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final CollectionReference _referenceMealList =
      FirebaseFirestore.instance.collection('meal');

  late Future<QuerySnapshot> _futureData;
  List<Map> _mealItems = [];

  @override
  initState() {
    super.initState();
    _futureData = _referenceMealList.get();
    _futureData.then((value) {
      setState(() {
        _mealItems = parseData(value);
      });
    });
  }

  List<Map> parseData(QuerySnapshot querySnapShot) {
    if (kDebugMode) {
      print("Number of documents fetched: ${querySnapShot.docs.length}");
    }
    List<QueryDocumentSnapshot> listDocs = querySnapShot.docs;
    List<Map> listMeals = listDocs
        .map((e) => {'item_name': e['name'], 'item_quantity': e['quantity']}).toList();

    return listMeals;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _mealItems.isEmpty
            ? const Center(
                child: Text('No items found'),
              )
            : buildListView(_mealItems));
  }

  ListView buildListView(List<Map<dynamic, dynamic>> mealItems) {
    return ListView.builder(
      itemCount: _mealItems.length,
      itemBuilder: (context, index) {
        Map thisItem = _mealItems[index];
        return ListTile(
          title: Text(thisItem['item_name']),
          subtitle: Text(thisItem['item_quantity']),
        );
      },
    );
  }
}
