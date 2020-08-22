import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users/paymentScreen.dart';

import 'constants.dart';

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
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Quantity",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                    'Schedule Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Wrap(
                        children: [
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
                          ),
                          RaisedButton(
                            child: Text('4:20PM to 4:40PM'),
                            onPressed: () {},
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
          Container(
            height: 60,
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentScreen();
                    },
                  ),
                );
              },
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
