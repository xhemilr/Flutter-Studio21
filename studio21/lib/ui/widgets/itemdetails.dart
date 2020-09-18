import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:studio21/utils/network.dart';

class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          elevation: 8,
          child: Container(
            height: screenHeight * 0.1,
            width: screenWidth * 0.3,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      'test',
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
        ),
        Card(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          elevation: 8,
          child: Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.3,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      'serviceDescription',
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
        ),
        Flexible(
          child: Card(
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            elevation: 8,
            child: Container(
              margin: const EdgeInsets.all(20),
              height: screenHeight * 0.39,
              width: screenWidth * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Paid Items:',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: LiteRollingSwitch(
                          value: true,
                          textOn: 'Enabled',
                          textOff: 'Disabled',
                          colorOn: Colors.green,
                          colorOff: Colors.blueGrey,
                          iconOn: Icons.check,
                          iconOff: Icons.power_settings_new,
                          onChanged: (bool state) {
//                        print('turned ${(state) ? 'on' : 'off'}');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Serviced Items:',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: LiteRollingSwitch(
                          value: true,
                          textOn: 'Enabled',
                          textOff: 'Disabled',
                          colorOn: Colors.green,
                          colorOff: Colors.blueGrey,
                          iconOn: Icons.check,
                          iconOff: Icons.power_settings_new,
                          onChanged: (bool state) {
//                        print('turned ${(state) ? 'on' : 'off'}');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          value: true,
                          textOn: 'Enabled',
                          textOff: 'Disabled',
                          colorOn: Colors.green,
                          colorOff: Colors.blueGrey,
                          iconOn: Icons.check,
                          iconOff: Icons.power_settings_new,
                          onChanged: (bool state) {
//                        print('turned ${(state) ? 'on' : 'off'}');
                          },
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
