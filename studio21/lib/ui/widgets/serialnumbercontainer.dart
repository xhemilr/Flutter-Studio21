import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio21/utils/data.dart';

class SerialNumberContainer extends StatefulWidget {
  const SerialNumberContainer({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  _SerialNumberContainerState createState() => _SerialNumberContainerState();
}

class _SerialNumberContainerState extends State<SerialNumberContainer> {
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
        height: widget.screenHeight * 0.1,
        width: widget.screenWidth * 0.3,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  itemData.serialNumber != null ? itemData.serialNumber : "",
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
              flex: 2,
              child: Text(
                'Serial Number',
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
