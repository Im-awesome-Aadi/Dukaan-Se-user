import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users/screens/finalOrderDetails.dart';

import 'package:users/utilities/constants.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPickUpOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Text.rich(
              TextSpan(text: 'Payable Amount: ', children: [
                TextSpan(
                    text: '350/-', style: TextStyle(color: kJuicyRedColor)),
              ]),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  title: Text('Wallets'),
                ),
                ExpansionTile(
                  title: Text('UPI'),
                ),
                ExpansionTile(
                  title: Text('NetBanking'),
                ),
                ExpansionTile(
                  title: Text('Card'),
                ),
//                ListTile(
//                  title: Text(
//                    'or',
//                    textAlign: TextAlign.center,
//                  ),
//                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.platform,
                  value: isPickUpOn,
                  title: Text(
                    'Pay On PickUp',
                  ),
//                  subtitle: Text(
//                    'Recommended',
//                    style: TextStyle(color: kJuicyRedColor),
//                  ),
                  onChanged: (val) {
                    setState(() {
                      isPickUpOn = val;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            child: PaymentButton(
              isEnabled: isPickUpOn,
              onEnabled: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderDetails();
                    },
                  ),
                );
              },
              onDisabled: () {},
            ),
          )
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  PaymentButton({
    Key key,
    @required this.isEnabled,
    @required this.onEnabled,
    this.onDisabled,
  }) : super(key: key);

  final bool isEnabled;
  final Function onEnabled;
  final Function onDisabled;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: isEnabled ? Colors.blue : Colors.grey,
      onPressed: isEnabled ? onEnabled : onDisabled,
      child: Text(
        'Confirm Payment',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
