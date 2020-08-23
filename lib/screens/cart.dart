import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users/screens/payment/paymentScreen.dart';

import 'package:users/utilities/constants.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int timeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cart Items',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(5),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Quantity",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("2"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("1"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("20"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("4"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("4"),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Item Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Coco-Cola(750 ml)"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Brown Bread "),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Eggs"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Chocolate Biscuits"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Kurkure(90g)"),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "Item Amount",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Rs 90 "),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Rs. 40"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Rs. 100"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Rs. 40"),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Text("Rs. 80"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Choose Pick-up Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Wrap(
                          children: [
                            TimePickerButton(
                              time: '4:00PM to 4:20PM',
                              isEnabled: timeSlot == 0,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 0;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '4:20PM to 4:40PM',
                              isEnabled: timeSlot == 1,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 1;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '4:40PM to 5:00PM',
                              isEnabled: timeSlot == 2,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 2;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '5:00PM to 5:20PM',
                              isEnabled: timeSlot == 3,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 3;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '5:20PM to 5:40PM',
                              isEnabled: timeSlot == 4,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 4;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '5:40PM to 6:00PM',
                              isEnabled: timeSlot == 5,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 5;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '6:00PM to 6:20PM',
                              isEnabled: timeSlot == 6,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 6;
                                });
                              },
                            ),
                            TimePickerButton(
                              time: '6:20PM to 6:40PM',
                              isEnabled: timeSlot == 7,
                              onPressed: () {
                                setState(() {
                                  timeSlot = 7;
                                });
                              },
                            ),
                          ],
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceEvenly,
//                      spacing: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            child: RaisedButton(
              color: Colors.blue,
              onPressed: timeSlot != null
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return PaymentScreen();
                          },
                        ),
                      );
                    }
                  : null,
              child: Text(
                'Proceed to Payment',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimePickerButton extends StatelessWidget {
  const TimePickerButton({
    this.time,
    this.onPressed,
    this.isEnabled,
    Key key,
  }) : super(key: key);
  final String time;
  final Function onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: isEnabled ? kSecondaryColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        time,
        style: TextStyle(
          color: isEnabled ? Colors.white : Colors.black,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
