import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio21/model/serviceitem.dart';
import 'package:studio21/ui/screens/edit_item_screen.dart';
import 'package:studio21/utils/data.dart';

class ItemRow extends StatelessWidget {

  final Item _item;

  ItemRow(this._item);

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<Data>(context);
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
//                  margin: const EdgeInsets.only(bottom: 10),
                  child: CircleAvatar(
                    backgroundColor: _item.serviceStatus ?
                    _item.paymentStatus ? Colors.green : Colors.blue
                        : Colors.orangeAccent,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            _item.price != null ? _item.price.toString() : "0.00",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            'den',
                            style: TextStyle(
                              fontSize: 12,
                                color: Colors.black87
                            ),
                          )
                        ],
                      ),
                    ),
                    radius: 30,
                  ),
                ),
                Divider(
                  height: 3,
                  thickness: 1,
                  color: Colors.blueAccent,
                  indent: 20,
                  endIndent: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: CustomRow(
              description: 'Contact Person',
              value: _item.contactPerson != null ? _item.contactPerson : "",
              textSize: 25,
            ),
          ),
          Flexible(
            flex: 5,
            child: CustomRow(
              value: _item.productDescription != null ? _item.productDescription : "",
              description: 'Service Description',
              textSize: 16,
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      _item.serviceStatus ? "Serviced" : "In progress",
                      style: TextStyle(
                        fontSize: 16,
                        color: _item.serviceStatus ? Colors.green : Colors.redAccent
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 3,
                  thickness: 1,
                  color: Colors.blueAccent,
                  indent: 20,
                  endIndent: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Service Status',
                    style: TextStyle(
                      fontSize: 12,
//                      decoration: TextDecoration.overline
                    ),
                  ),
                ),
              ],
            )
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      _item.paymentStatus ? "Closed" : "Open",
                      style: TextStyle(
                          fontSize: 16,
                          color: _item.paymentStatus ? Colors.green : Colors.redAccent
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 3,
                  thickness: 1,
                  color: Colors.blueAccent,
                  indent: 20,
                  endIndent: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Service Status',
                    style: TextStyle(
                      fontSize: 12,
//                      decoration: TextDecoration.overline
                    ),
                  ),
                ),
              ],
            )
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                dataProvider.setItem(_item);
                Navigator.pushNamed(context, EditItemScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String description;
  final String value;
  final double textSize;


  CustomRow({this.description, this.value, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: textSize,
              ),
            ),
          ),
        ),
        Divider(
          height: 3,
          thickness: 1,
          color: Colors.blueAccent,
          indent: 20,
          endIndent: 20,
        ),
        Flexible(
          flex: 1,
          child: Text(
            description,
            style: TextStyle(
              fontSize: 12,
//                      decoration: TextDecoration.overline
            ),
          ),
        ),
      ],
    );
  }
}



