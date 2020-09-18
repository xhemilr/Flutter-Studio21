import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio21/utils/data.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ServiceDetailContainer extends StatefulWidget {
  const ServiceDetailContainer({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  _ServiceDetailContainerState createState() => _ServiceDetailContainerState();
}

class _ServiceDetailContainerState extends State<ServiceDetailContainer> {
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Data>(context);
    return Card(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      elevation: 8,
      child: Container(
        height: widget.screenHeight * 0.3,
        width: widget.screenWidth * 0.3,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  itemData.serviceDescription != null ? itemData.serviceDescription : "",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Divider(
              height: 3,
              thickness: 1,
              color: Colors.blueAccent,
              indent: 30,
              endIndent: 30,
            ),
            Flexible(
              flex: 1,
              child: Text(
                'Service Description',
                style: TextStyle(
                  fontSize: 12,
//                      decoration: TextDecoration.overline
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}