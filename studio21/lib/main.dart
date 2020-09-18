import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio21/ui/screens/edit_item_screen.dart';
import 'package:studio21/ui/screens/new_item_screen.dart';

import 'ui/screens/home_page.dart';
import 'utils/data.dart';

void main() {
  runApp(
     ChangeNotifierProvider(
       create: (_) => Data(),
       child: MaterialApp(
          title: "Studio 21",
          debugShowCheckedModeBanner: false,
          home: HomePage(),
         routes: {
           EditItemScreen.routeName : (ctx)=>EditItemScreen(),
           NewItemScreen.routeName : (_)=>NewItemScreen(),
         },
        ),
     ),
  );
}