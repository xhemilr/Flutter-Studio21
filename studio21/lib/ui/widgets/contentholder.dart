import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio21/model/serviceitem.dart';
import 'package:studio21/utils/data.dart';

import 'itemcard.dart';

class ContentHolder extends StatefulWidget {
  const ContentHolder({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  _ContentHolderState createState() => _ContentHolderState();
}

class _ContentHolderState extends State<ContentHolder> {
  int selected = 0;
  var searchController = TextEditingController();

  var textFilter = (item, itemData) => (
      item.contactPerson
          .toLowerCase()
          .contains(itemData.searchText.toLowerCase()) ||
      item.serialNumber
          .toLowerCase()
          .contains(itemData.searchText.toLowerCase()));

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Data>(context);
    String searchText = itemData.searchText;
    List<Item> items = itemData.items.where((item) {
      if (itemData.showCompleted == false) {
        return (item.contactPerson
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            item.serialNumber.toLowerCase().contains(searchText.toLowerCase()));
      }
      return item.paymentStatus == false &&
          (item.contactPerson
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) ||
              item.serialNumber
                  .toLowerCase()
                  .contains(searchText.toLowerCase()));
    }).toList();

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 8,
          child: Row(
            children: [
              Expanded(flex: 1, child: Icon(Icons.search)),
              Expanded(
                  flex: 10,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter S/N or contact name to search'),
                    controller: searchController,
                    onChanged: (value) {
                      itemData.searchText = value;
                    },
                  )),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    itemData.searchText = "";
                    searchController.clear();
                  },
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: widget.screenHeight * 0.81,
            width: widget.screenWidth * 1.2,
            child: Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 8,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: selected == index
                        ? Colors.blueGrey.shade100
                        : Colors.white,
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Colors.blueGrey,
                      onTap: () {
                        setState(() {
                          selected = index;
                          itemData.setServiceDescription(
                              items[index].serviceDescription);
                          itemData.setSerialNumber(items[index].serialNumber);
                        });
                      },
                      child: ItemRow(items[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
