import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:users/api/getProducts.dart';
import 'package:users/utilities/constants.dart';

import 'package:users/screens/cart.dart';

class ShopDetails extends StatefulWidget {
  ShopDetails({
    this.shopId,
    this.shopName,
    this.userId,
    this.shopAddress,
    this.categoryImg,
    this.shopOwnerName,
    this.shopTimings,
    this.shopOffHours,
    this.index,
  });
  final String shopId;
  final String shopName;
  final String shopOwnerName;
  final String shopTimings;
  final String shopOffHours;
  final String userId;
  final String shopAddress;
  final String categoryImg;
  final int index;
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
//  List<String> productTitle;
//  List<int> productAmount;
//  List<int> productQuantity;

  Random random = Random();

  final _formKey = GlobalKey<FormState>();
  TextEditingController ownerNameTextController;
  TextEditingController addressTextController;
  TextEditingController shopTimingsTextController;
  TextEditingController shopOffHoursTextController;

  bool readOnly = true;
  bool saved = false;

  List productsName = [
    'Rice',
    'Packaged Milk',
    'Coco Cola',
    'Bread',
    'Eggs',
    'Wheat',
    'Chocolate Biscuit',
    'Kurkure'
  ];
  List productAmount = ['40/kg', '45/L', '40', '35', '5', '28/kg', '20', '20'];
//  List<int> num;

  List serviceAmount = ['100', '90', '150', '150', '500', '70'];

  List serviceName = [
    'Haircut',
    'Shave',
    'Hair Dyes',
    'Facial',
    'Massage',
    'Hair Styling',
  ];

  List serviceImg = [
    'https://www.menshairstylestoday.com/wp-content/uploads/2018/03/Cheap-Barber-Shop-Haircuts-For-Men.jpg',
    'https://images.pexels.com/photos/1319461/pexels-photo-1319461.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-181879127-1589643370.jpg',
    'https://www.salonsdirect.com/blog/wp-content/uploads/2017/08/Beauty-salon-marketing-towards-men.jpg',
    'https://c8.alamy.com/comp/C31M6K/a-man-gets-an-old-fashioned-vibrating-head-massage-at-a-barber-shop-C31M6K.jpg',
    'https://c1.wallpaperflare.com/preview/405/255/732/expocosmetica-presentation-model-hairdresser-cut-hair-thumbnail.jpg',
  ];

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
//    num = [
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//      random.nextInt(4) + 2,
//    ];

    ownerNameTextController = TextEditingController(text: widget.shopOwnerName);
    addressTextController = TextEditingController(text: widget.shopAddress);
    shopTimingsTextController = TextEditingController(text: widget.shopTimings);
    shopOffHoursTextController =
        TextEditingController(text: widget.shopOffHours);

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

    // getData();
  }

  getData() async {
    print('merchants/${widget.shopId}/products');
    var a = await GetProduct(merchantID: widget.shopId).getProductData();
    print(a);
    /* for (var i in a){
      print(i['t']);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: FlatButton(
          color: Colors.blue,
          child: Text(
            'Checkout',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CartScreen();
            }));
          },
        ),
      ),
      body: Builder(
        builder: (context) {
          return SliverFab(
//            topScalingEdge: 0,
            floatingWidget: FloatingActionButton(
//              backgroundColor: saved ? kSecondaryColor : kPrimaryColor,
              backgroundColor: Colors.pinkAccent,
              child: Icon(
                saved ? Icons.favorite : Icons.favorite_border,
                color: saved ? Colors.white : Colors.white,
              ),
              onPressed: saved ? onDislike : onLike,
            ),
            slivers: [
              SliverAppBar(
//                elevation: 20,

                backgroundColor: Colors.white,
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  title: Text(widget.shopName ?? 'Shop'),
                  background: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          widget.categoryImg ??
                              'https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CartScreen();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: widget.index == 0,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 30, bottom: 20),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Products',
                          style: kAddProductTextStyle,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.2),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: widget.index == 0,
                  child: Container(
                    height: 270,
                    child: GridView.builder(
                        itemCount: productsName.length,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.3,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Image.asset(
                                      'assets/product${index + 1}.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Text(
                                            productsName[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
//                                            fontWeight: FontWeight.bold,
//                                            fontSize: 16,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          productAmount[index],
                                          style: TextStyle(
                                            color: kJuicyRedColor,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (quantities[index] > 0) {
                                                    quantities[index] =
                                                        quantities[index] - 1;
                                                  }
                                                });
                                              },
                                              child: Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Icon(Icons.remove),
                                                ),
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              quantities[index].toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  quantities[index] =
                                                      quantities[index] + 1;
                                                });
                                              },
                                              child: Card(
                                                child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Icon(Icons.add),
                                                ),
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

//                                Expanded(
//                                  flex: 3,
//                                  child: Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceAround,
//                                    children: [
//                                      Icon(
//                                        num >= 1
//                                            ? Icons.star
//                                            : Icons.star_border,
//                                        color: Color(0xffFFBE00),
//                                      ),
//                                      Icon(
//                                        num >= 2
//                                            ? Icons.star
//                                            : Icons.star_border,
//                                        color: Color(0xffFFBE00),
//                                      ),
//                                      Icon(
//                                        num >= 3
//                                            ? Icons.star
//                                            : Icons.star_border,
//                                        color: Color(0xffFFBE00),
//                                      ),
//                                      Icon(
//                                        num >= 4
//                                            ? Icons.star
//                                            : Icons.star_border,
//                                        color: Color(0xffFFBE00),
//                                      ),
//                                      Icon(
//                                        num >= 5
//                                            ? Icons.star
//                                            : Icons.star_border,
//                                        color: Color(0xffFFBE00),
//                                      ),
//                                    ],
//                                  ),
//                                )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Visibility(
                  visible: widget.index != 0,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 30, bottom: 20),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Services',
                          style: kAddProductTextStyle,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.2),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Visibility(
                  visible: widget.index != 0,
                  child: Container(
                    height: 270,
                    child: GridView.builder(
                      itemCount: serviceName.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CartScreen();
                                  },
                                ),
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Image.network(
                                      serviceImg[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            serviceName[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            '${serviceAmount[index]}/- per person',
                                            style: TextStyle(
                                                color: kJuicyRedColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
                                  'Owner Name',
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
                                  'Address',
                                  style: kAddProductTextStyle,
                                ),
                              ),
                              TextFormField(
                                controller: addressTextController,
                                readOnly: readOnly,
                                maxLines: 4,
                                decoration: kAddProductInputDecoration.copyWith(
                                    hintText: 'Ex:- This is Mango from USA'),
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
                                  'Shop Timings',
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
                                  'Shop Off Timings',
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
                      ],
                    ),
                  ),
                ),
              ),

//              SliverGrid(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2,
//                ),
//                delegate: SliverChildBuilderDelegate(
//                  (BuildContext context, int index) {
//                    return Container(
//                      alignment: Alignment.center,
//                      color: Colors.teal[100 * (index % 9)],
//                      child: Text('grid item $index'),
//                    );
//                  },
//                  childCount: 20,
//                ),
//              ),
            ],
          );
        },
      ),
    );
  }

//      body: ListView(
//        shrinkWrap: true,
//        physics: ScrollPhysics(),
//        children: <Widget>[
//          Text("${widget.shopAddress}"),
//          FutureBuilder(
//            future: GetProduct(merchantID: widget.shopId).getProductData(),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                productAmount = [];
//                productTitle = [];
//                productQuantity = [];
//                for (var i in snapshot.data) {
//                  productAmount.add(i['p']);
//                  productQuantity.add(i['q']);
//                  productTitle.add(i['t']);
//                }
//                return ListView.builder(
//                  shrinkWrap: true,
//                  physics: ScrollPhysics(),
//                  itemCount: productTitle.length,
//                  itemBuilder: (builder, index) {
//                    return Text("${productTitle[index]}");
//                  },
//                );
//              }
//              return CircularProgressIndicator();
//            },
//          )
//        ],
//      ),
//    );
}
