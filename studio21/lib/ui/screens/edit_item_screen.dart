import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:studio21/ui/widgets/password_field.dart';
import 'package:studio21/ui/widgets/payment_status_container.dart';
import 'package:studio21/ui/widgets/service_status.dart';
import 'package:studio21/utils/data.dart';
import 'package:studio21/utils/network.dart';


// ignore: must_be_immutable
class EditItemScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  var contactPersonController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var productTypeController = TextEditingController();

  var productDescriptionController = TextEditingController();

  var serialNumberController = TextEditingController();

  var serviceDescriptionController = TextEditingController();

  var priceFieldController = TextEditingController();

  String receivedDate = "";

  String completedDate = "";

  var emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<Data>(context);


    contactPersonController.text = dataProvider.selectedItem.contactPerson != null ? dataProvider.selectedItem.contactPerson : "";
    phoneNumberController.text = dataProvider.selectedItem.phoneNumber != null ? dataProvider.selectedItem.phoneNumber : "";
    productTypeController.text = dataProvider.selectedItem.productType != null ? dataProvider.selectedItem.productType : "";
    productDescriptionController.text = dataProvider.selectedItem.productDescription != null ? dataProvider.selectedItem.productDescription : "";
    serialNumberController.text = dataProvider.selectedItem.serialNumber != null ? dataProvider.selectedItem.serialNumber : "";
    serviceDescriptionController.text = dataProvider.selectedItem.serviceDescription != null ? dataProvider.selectedItem.serviceDescription : "";
    priceFieldController.text = dataProvider.selectedItem.price.toString() != null ? dataProvider.selectedItem.price.toString() : "0.00";
    receivedDate = DateFormat('dd-MMM-yyyy').format(DateTime.tryParse(dataProvider.selectedItem.receivedDate));
    completedDate = DateFormat('dd-MMM-yyyy').format(DateTime.tryParse(dataProvider.selectedItem.completedDate));
    emailController.text = dataProvider.selectedItem.email != null ?dataProvider.selectedItem.email : "" ;

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Details"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              dataProvider.selectedItem.productDescription = productDescriptionController.text;
              dataProvider.selectedItem.serialNumber = serialNumberController.text;
              print(dataProvider.selectedItem.serialNumber);
              Network().sendData(dataProvider.selectedItem);

            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Card(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.person)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Contact Person"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: contactPersonController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Contact Person'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.phone)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Phone Number"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: phoneNumberController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Phone Number'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.tablet_android)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Product Type"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: productTypeController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Product Type (ex. Tablet, laptop, home pc, etc.'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.important_devices)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Product Description"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: productDescriptionController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Product Description (ex. Samsung A8, Iphone XS, etc.'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.description)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Serial Number"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: serialNumberController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Serial Number'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.build)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Service Description"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: serviceDescriptionController,
                                        maxLines: 5,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Service Description'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: screenHeight * 0.12,
                            width: screenWidth * 0.48,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Icon(Icons.email)),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Email address"),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: emailController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder(
                                                borderSide: BorderSide()),
                                            hintText: 'Email address'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          PasswordField(screenHeight: screenHeight, screenWidth: screenWidth),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 30, bottom: 5),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ServiceStatusContainer(dataProvider.selectedItem.serviceStatus, screenHeight: screenHeight, screenWidth: screenWidth,),
                              PaymentStatusContainer(dataProvider.selectedItem.paymentStatus,screenHeight: screenHeight, screenWidth: screenWidth,)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: screenHeight * 0.15,
                                width: screenWidth * 0.2,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 8,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 1, child: Icon(Icons.date_range)),
                                      Expanded(
                                        flex: 2,
                                        child: Text("Received Date"),
                                      ),
                                      VerticalDivider(
                                        thickness: 1,
                                        indent: 10,
                                        endIndent: 10,
                                        color: Colors.blueGrey
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Text(
                                            receivedDate,
                                            style: TextStyle(
                                              fontSize: 18
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.15,
                                width: screenWidth * 0.2,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 8,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 1, child: Icon(Icons.date_range)),
                                      Expanded(
                                        flex: 2,
                                        child: Text("Serviced Date"),
                                      ),
                                      VerticalDivider(
                                          thickness: 1,
                                          indent: 10,
                                          endIndent: 10,
                                          color: Colors.blueGrey
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Text(
                                            completedDate,
                                            style: TextStyle(
                                                fontSize: 18
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: screenHeight * 0.20,
                                width: screenWidth * 0.20,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 8,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 10, top: 20, left: 10),
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold
                                      ),
                                      controller: priceFieldController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide()),
                                          hintText: 'Total Price',
                                          hintStyle: TextStyle(
                                            fontSize: 34
                                          ),
                                          prefixText: "Total:",
                                        suffixText: "den"
                                      ),
                                    ),
                                  )
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: screenHeight * 0.30,
                                width: screenWidth * 0.20,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 8,
                                  child: QrImage(
                                    data:'tel:${dataProvider.selectedItem.phoneNumber}',
                                    version: QrVersions.auto,
                                    size: 200,
                                    gapless: false,
                                  )
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

