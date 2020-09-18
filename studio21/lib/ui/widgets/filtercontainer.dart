import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:studio21/utils/data.dart';

import '../../main.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  _FilterContainerState createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<Data>(context);
    return Flexible(
      child: Card(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        elevation: 8,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            height: widget.screenHeight * 0.39,
            width: widget.screenWidth * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: widget.screenHeight * 0.13,
                  width: widget.screenWidth * 0.3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Show Closed Items',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: LiteRollingSwitch(
                          value: false,
                          textOn: 'Enabled',
                          textOff: 'Disabled',
                          colorOn: Colors.green,
                          colorOff: Colors.blueGrey,
                          iconOn: Icons.check,
                          iconOff: Icons.power_settings_new,
                          onChanged: (bool value){
                            dataProvider.showCompleted = !value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: widget.screenHeight * 0.13,
                  width: widget.screenWidth * 0.3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Date Filter:',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: LiteRollingSwitch(
                          value: false,
                          textOn: 'Enabled',
                          textOff: 'Disabled',
                          colorOn: Colors.green,
                          colorOff: Colors.blueGrey,
                          iconOn: Icons.check,
                          iconOff: Icons.power_settings_new,
                          onChanged: (bool value){

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: widget.screenHeight * 0.13,
                  width: widget.screenWidth * 0.3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Date Filter:',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: LiteRollingSwitch(
                          value: false,
                          textOn: 'Enabled',
                          textOff: 'Disabled',
                          colorOn: Colors.green,
                          colorOff: Colors.blueGrey,
                          iconOn: Icons.check,
                          iconOff: Icons.power_settings_new,
                          onChanged: (bool value){

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}