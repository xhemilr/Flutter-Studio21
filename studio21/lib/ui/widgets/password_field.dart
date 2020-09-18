import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studio21/utils/data.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool showPassword = false;

  var passwordController = TextEditingController();

  void showPasswordFun(){
    setState(() {
      showPassword = showPassword ? false : true;
    });
  }
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<Data>(context);
    passwordController.text = dataProvider.selectedItem.password;
    return Container(
      height: widget.screenHeight * 0.12,
      width: widget.screenWidth * 0.48,
      child: Card(
        margin: const EdgeInsets.only(
            top: 20, left: 10, right: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        child: Row(
          children: [
            Expanded(flex: 1, child: Icon(showPassword ? Icons.lock_open : Icons.lock)),
            Expanded(
              flex: 2,
              child: Text("Password"),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                child: TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide()),
                      hintText: 'Password'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: (){
                  showPasswordFun();
                },
                child: Text(showPassword ? "Hide" : "Show"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
