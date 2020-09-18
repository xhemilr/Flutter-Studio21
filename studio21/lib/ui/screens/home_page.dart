import 'package:flutter/material.dart';
import 'package:studio21/model/serviceitem.dart';
import 'package:studio21/ui/screens/edit_item_screen.dart';
import 'package:studio21/ui/screens/new_item_screen.dart';
import 'package:studio21/utils/data.dart';
import 'package:studio21/utils/network.dart';
import 'package:provider/provider.dart';

import 'home_page_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Studio 21'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
              iconSize: 35,
              tooltip: "Add New Item",
              hoverColor: Colors.green,
              onPressed: (){
              Navigator.pushNamed(context, NewItemScreen.routeName);
              },
          )
        ],
      ),
      body: FutureBuilder<List<Item>>(
        future: Network().fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          itemData.items = snapshot.data;
          return snapshot.hasData
          ? HomePageBody()
            : Center(child: CircularProgressIndicator());
          },
      ),
    );
  }
}