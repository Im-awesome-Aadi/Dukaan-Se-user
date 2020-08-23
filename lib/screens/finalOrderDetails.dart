import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

import 'package:users/utilities/constants.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Done',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Payment Successful',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Order ID - #832479823',
                style: TextStyle(fontSize: 20),
              ),
              Image.asset('assets/qrCode.png'),
              Text(
                'Show this QR code to merchant at pick up',
                style: TextStyle(fontSize: 16),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Back To Home',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/Dash');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
