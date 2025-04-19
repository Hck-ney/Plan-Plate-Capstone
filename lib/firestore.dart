/*
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
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});



  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  final CollectionReference _myCollection = FirebaseFirestore.instance.collection('dish'); // Replace 'your_collection_name'
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _myCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              // Customize how you want to display the data in the Card
              String imageUrl = data['image'] ?? ''; // Assuming you have an 'image_url' field
              String title = data['name'] ?? 'No Title';
              String description = data['ingredients'] ?? 'No Description';

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (imageUrl.isNotEmpty)
                      Ink.image(
                        image: NetworkImage(imageUrl),
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(description),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
