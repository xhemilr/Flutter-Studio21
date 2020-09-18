import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceStatusContainer extends StatefulWidget {
  ServiceStatusContainer(
      this.status,
      {
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  var status;
  @override
  _ServiceStatusContainerState createState() => _ServiceStatusContainerState();
}

class _ServiceStatusContainerState extends State<ServiceStatusContainer> {
  @override
  Widget build(BuildContext context) {
    if(widget.status == null){
      widget.status = false;
    }
    return Container(
      height: widget.screenHeight * 0.12,
      width: widget.screenWidth * 0.2,
      child: Card(
        margin: const EdgeInsets.only(
            top: 20, left: 10, right: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        child: Row(
          children: [
            Expanded(flex: 2, child: Icon(Icons.sync_problem)),
            Expanded(
              flex: 2,
              child: Text("Service Status"),
            ),
            VerticalDivider(
              thickness: 1,
              color: Colors.blueGrey,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        widget.status ? "Serviced" : "In process",
                        style: TextStyle(
                            fontSize:  16,
                            color: widget.status ? Colors.green : Colors.red
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Switch(
                      value: widget.status,
                      onChanged: (value){
                        setState(() {
                          widget.status = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
