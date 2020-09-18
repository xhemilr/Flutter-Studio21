import 'package:flutter/material.dart';
import 'package:studio21/ui/widgets/contentholder.dart';
import 'package:studio21/ui/widgets/filtercontainer.dart';
import 'package:studio21/ui/widgets/serialnumbercontainer.dart';
import 'package:studio21/ui/widgets/servicedetailcontainer.dart';


class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ContentHolder(screenHeight: screenHeight, screenWidth: screenWidth),
          ),
          Expanded(
            flex: 2,
            child:
              Column(
                children: [
                  SerialNumberContainer(screenHeight: screenHeight, screenWidth: screenWidth),
                  ServiceDetailContainer(screenHeight: screenHeight, screenWidth: screenWidth),
                  FilterContainer(screenHeight: screenHeight, screenWidth: screenWidth)
                ],
              )
          )
        ],
      ),
    );
  }
}