import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

import 'constants.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController ownerNameTextController;

  TextEditingController addressTextController;

  TextEditingController shopTimingsTextController;

  TextEditingController shopOffHoursTextController;

  bool readOnly = true;

  bool saved = false;

  List<int> quantities = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  FocusNode focusNode;

  Function onLike;

  Function onDislike;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ownerNameTextController = TextEditingController(text: 'hello');
    addressTextController = TextEditingController(text: 'hello');
    shopTimingsTextController = TextEditingController(text: 'hello');
    shopOffHoursTextController = TextEditingController(text: 'hello');

    onLike = () {
      setState(() {
        saved = true;
      });
    };
    onDislike = () {
      setState(() {
        saved = false;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return SliverFab(
            expandedHeight: 200,
//            topScalingEdge: 0,
            floatingWidget: FloatingActionButton(
//
              backgroundColor: Colors.green,
              child: Icon(
                Icons.share,
              ),
              onPressed: saved ? onDislike : onLike,
            ),
            slivers: [
              SliverAppBar(
//                elevation: 20,
                backgroundColor: Colors.white,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  title: Text(''),
                  background: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(color: kPrimaryColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thank you for Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            'We are processing your order now. Here are the details',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Order Number',
                                  style: kAddProductTextStyle,
                                ),
                              ),
                              TextFormField(
                                controller: ownerNameTextController,
                                focusNode: focusNode,
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                style: kTextStyle.copyWith(color: Colors.black),
                                decoration: kAddProductInputDecoration.copyWith(
                                    hintText: 'Ex:- Mango'),
                                validator: (value) => value.isEmpty
                                    ? "Name cannot be empty"
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Order Date',
                                  style: kAddProductTextStyle,
                                ),
                              ),
                              TextFormField(
                                controller: shopTimingsTextController,
                                focusNode: focusNode,
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                style: kTextStyle.copyWith(color: Colors.black),
                                decoration: kAddProductInputDecoration.copyWith(
                                    hintText: 'Ex:- Mango'),
                                validator: (value) => value.isEmpty
                                    ? "Name cannot be empty"
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Payment Type',
                                  style: kAddProductTextStyle,
                                ),
                              ),
                              TextFormField(
                                controller: shopOffHoursTextController,
                                focusNode: focusNode,
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                style: kTextStyle.copyWith(color: Colors.black),
                                decoration: kAddProductInputDecoration.copyWith(
                                    hintText: 'Ex:- Mango'),
                                validator: (value) => value.isEmpty
                                    ? "Name cannot be empty"
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Amount',
                                  style: kAddProductTextStyle,
                                ),
                              ),
                              TextFormField(
                                controller: shopOffHoursTextController,
                                focusNode: focusNode,
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                style: kTextStyle.copyWith(color: Colors.black),
                                decoration: kAddProductInputDecoration.copyWith(
                                    hintText: 'Ex:- Mango'),
                                validator: (value) => value.isEmpty
                                    ? "Name cannot be empty"
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ExpansionTile(
                            onExpansionChanged: (val) async {
                              setState(() {});
                              await Future.delayed(Duration(seconds: 2), () {
                                setState(() {});
                              });
                            },
                            title: Text('Items Details'),
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "Quantity",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("2"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("1"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("20"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("4"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("4"),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "Item Name",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Coco-Cola(750 ml)"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Brown Bread "),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Eggs"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Chocolate Biscuits"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Kurkure(90g)"),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            "Item Amount",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Rs 90 "),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Rs. 40"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Rs. 100"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Rs. 40"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text("Rs. 80"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
