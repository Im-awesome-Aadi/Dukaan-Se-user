import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:users/utilities/constants.dart';
import 'file:///C:/Users/shash/OneDrive/Desktop/flutterProjects/users/lib/screens/shopDetails.dart';
import 'dart:math';

import 'cart.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Random random = Random();
  String userId;
  var _stream;

  List<Map<String, dynamic>> storesData = [
    {
      'shopName': 'Satyam General Store',
      'category': 'General Store',
      'shopOwnerName': 'Akash Gupta',
      'address':
          '490, Bhim Market , Pandav Road, Dilshad Garden, Delhi - 110032',
      'shopTimings': '9AM to 8PM',
      'shopOffHours': '1PM to 2PM',
    },
    {
      'shopName': 'No.1 Saloon',
      'category': 'Saloon',
      'shopOwnerName': 'Rohan Gupta',
      'address': '13/2 , Gola Market, Sarita Vihar ,Delhi- 098760',
      'shopTimings': '9AM to 7PM',
      'shopOffHours': '11AM to 4PM',
    },
    {
      'shopName': 'Gupta Jewellers',
      'category': 'Jewellers',
      'shopOwnerName': 'Shashank Gupta',
      'address':
          '2/49, Near Bhim Street, Pandav Road, Shahdara, Delhi - 110032',
      'shopTimings': '9AM to 8PM',
      'shopOffHours': '1PM to 2PM',
    },
    {
      'shopName': 'Awasthi Supplement',
      'category': 'Supplement shop',
      'shopOwnerName': 'Harshit Awasthi',
      'address':
          '776, Near Teacher Colony, Bahadurgarh Road, Jhajjar, Haryana - 199032',
      'shopTimings': '10AM to 8PM',
      'shopOffHours': '1PM to 2PM',
    },
    {
      'shopName': 'Jyoti Parlour',
      'category': 'Beauty Parlour',
      'shopOwnerName': 'Jyoti mahajan',
      'address':
          '2/88, Near Friends Colony, Pandav Road, Dwarka, Delhi - 110032',
      'shopTimings': '9AM to 8PM',
      'shopOffHours': '1PM to 2PM',
    },
    {
      'shopName': 'Aditya Dairy',
      'category': 'Dairy',
      'shopOwnerName': 'Aditya Maheshwari',
      'address':
          '02,Ground Floor,Adarsh Complex, Noida Road, Ghaziabad, U.P. - 198760',
      'shopTimings': '9AM to 5PM',
      'shopOffHours': '11AM to 3PM',
    },
    {
      'shopName': 'Mybody',
      'category': 'Supplement shop',
      'shopOwnerName': 'Aakash Sharma',
      'address': '20/90, Najafgarh Road, Dwarka, Delhi - 197769',
      'shopTimings': '9AM to 10PM',
      'shopOffHours': '1PM to 3PM',
    },
    {
      'shopName': 'Jain Dairy',
      'category': 'Dairy',
      'shopOwnerName': 'Kunal Jain',
      'address':
          '30/49, Near Bhim Street, Pandav Road, Shahdara, Delhi - 119444',
      'shopTimings': '9AM to 5PM',
      'shopOffHours': '11AM to 3PM',
    },
    {
      'shopName': 'H.C FOOD Bank',
      'category': 'Restaurants',
      'shopOwnerName': 'Hitesh',
      'address':
          'Hitesh Building ,1st Floor and 2nd Floor, Noida Road, Ghaziabad, U.P. - 198760',
      'shopTimings': '5PM to 12PM',
      'shopOffHours': '10PM to 10.15PM',
    },
    {
      'shopName': 'Anu Cosmetics',
      'category': 'Cosmetics',
      'shopOwnerName': 'Anu Yadav',
      'address':
          '80,4th Floor,Kajal Complex, Murthal Road, Sonipat, Haryana - 183750',
      'shopTimings': '9AM to 8PM',
      'shopOffHours': '2PM to 3PM',
    },
  ];

//  List<Map<String, dynamic>> categories = [
//    {
//      'name': 'Jewellers',
//      'img':
//          'https://images.pexels.com/photos/135620/pexels-photo-135620.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
//    },
//    {
//      'name': 'Food Shop',
//      'img':
//          'https://images.pexels.com/photos/3962286/pexels-photo-3962286.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
//    },
//    {
//      'name': 'Barber Shop',
//      'img':
//          'https://images.pexels.com/photos/1813272/pexels-photo-1813272.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
//    },
//    {
//      'name': 'Beauty Parlour',
//      'img':
//          'https://images.pexels.com/photos/457701/pexels-photo-457701.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
//    },
//  ];

  Map<String, dynamic> categories = {
    'Jewellers':
        'https://images.pexels.com/photos/135620/pexels-photo-135620.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'Beauty Parlour':
        'https://images.pexels.com/photos/457701/pexels-photo-457701.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'Saloon':
        'https://images.pexels.com/photos/1813272/pexels-photo-1813272.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'Restaurants':
        'https://images.pexels.com/photos/3962286/pexels-photo-3962286.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'Supplement shop':
        'https://www.abc.net.au/cm/rimage/3774110-16x9-xlarge.jpg?v=4',
    'Cosmetics':
        'https://img2023.weyesimg.com/uploads/ouyeedisplays.allweyes.com/images/15335255647304.jpg?imageView2/2/w/800/q/75',
    'Dairy':
        'https://content3.jdmagicbox.com/comp/mumbai/n8/022pxx22.xx22.170721153711.a4n8/catalogue/royal-dairy-farm-boisar-mumbai-cake-shops-47wgxo0.jpg',
    'General Store':
        'https://www.maxpixel.net/static/photo/1x/Choctaw-Bluff-Alabama-Gas-Pumps-General-Store-305932.jpg',
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = Firestore.instance.collection("merchants").snapshots();
    getUserId();
  }

  getUserId() async {
    final user = await FirebaseAuth.instance.currentUser();
    userId = await user.uid;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: Text("Dukaan Se"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
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
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Nearby Shops",
              ),
              Tab(
                text: "Category",
              ),
              Tab(
                text: "Saved",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
//                itemCount: shops.length,
              itemCount: storesData.length,
              itemBuilder: (context, index) {
//                  String shopId = shops[index].documentID;
//                  print(shopId.runtimeType);
//                  String shopName = shops[index].data['shopname'];
//                  String shopAddress = shops[index].data['address'];
//                  String categoryName =
//                      categories[index % categories.length]['name'];
//                  String categoryImage =
//                      categories[index % categories.length]['img'];

//                  String shopId = shops[index].documentID;

                String shopName = storesData[index]['shopName'];
                String shopAddress = storesData[index]['address'];
                String shopOwnerName = storesData[index]['shopOwnerName'];
                String shopTimings = storesData[index]['shopTimings'];
                String shopOffHours = storesData[index]['shopOffHours'];
                String categoryName = storesData[index]['category'];
                String categoryImage = categories[categoryName];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(categoryImage),
                          ),
                        ),
                      ),
                      title: Text(shopName ?? 'new'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '0.${random.nextInt(5) + 1} km',
                            style: TextStyle(color: kJuicyRedColor),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: kStarColor,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                '${random.nextInt(3) + 3}/5',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text(categoryName),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopDetails(
//                                shopId: shopId,
                              shopName: shopName,
                              shopOwnerName: shopOwnerName,
                              shopAddress: shopAddress,
                              shopTimings: shopTimings,
                              shopOffHours: shopOffHours,
                              userId: userId,
                              categoryImg: categoryImage,
                              index: index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
//                itemCount: shops.length,
                itemCount: storesData.length,
                itemBuilder: (context, index) {
//                  String shopId = shops[index].documentID;
//                  print(shopId.runtimeType);
//                  String shopName = shops[index].data['shopname'];
//                  String shopAddress = shops[index].data['address'];
//                  String categoryName =
//                      categories[index % categories.length]['name'];
//                  String categoryImage =
//                      categories[index % categories.length]['img'];

//                  String shopId = shops[index].documentID;

                  String shopName = storesData[index]['shopName'];
                  String shopAddress = storesData[index]['address'];
                  String shopOwnerName = storesData[index]['shopOwnerName'];
                  String shopTimings = storesData[index]['shopTimings'];
                  String shopOffHours = storesData[index]['shopOffHours'];
                  String categoryName = storesData[index]['category'];
                  String categoryImage = categories[categoryName];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(categoryImage),
                            ),
                          ),
                        ),
                        title: Text(shopName ?? 'new'),
                        trailing: Text(
                          '${random.nextInt(5) + 1} km',
                          style: TextStyle(color: kJuicyRedColor),
                        ),
                        subtitle: Text(categoryName),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopDetails(
//                                shopId: shopId,
                                shopName: shopName,
                                shopOwnerName: shopOwnerName,
                                shopAddress: shopAddress,
                                shopTimings: shopTimings,
                                shopOffHours: shopOffHours,
                                userId: userId,
                                categoryImg: categoryImage,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
//                itemCount: shops.length,
                itemCount: storesData.length,
                itemBuilder: (context, index) {
//                  String shopId = shops[index].documentID;
//                  print(shopId.runtimeType);
//                  String shopName = shops[index].data['shopname'];
//                  String shopAddress = shops[index].data['address'];
//                  String categoryName =
//                      categories[index % categories.length]['name'];
//                  String categoryImage =
//                      categories[index % categories.length]['img'];

//                  String shopId = shops[index].documentID;

                  String shopName = storesData[index]['shopName'];
                  String shopAddress = storesData[index]['address'];
                  String shopOwnerName = storesData[index]['shopOwnerName'];
                  String shopTimings = storesData[index]['shopTimings'];
                  String shopOffHours = storesData[index]['shopOffHours'];
                  String categoryName = storesData[index]['category'];
                  String categoryImage = categories[categoryName];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(categoryImage),
                            ),
                          ),
                        ),
                        title: Text(shopName ?? 'new'),
                        trailing: Text(
                          '${random.nextInt(5) + 1} km',
                          style: TextStyle(color: kJuicyRedColor),
                        ),
                        subtitle: Text(categoryName),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopDetails(
//                                shopId: shopId,
                                shopName: shopName,
                                shopOwnerName: shopOwnerName,
                                shopAddress: shopAddress,
                                shopTimings: shopTimings,
                                shopOffHours: shopOffHours,
                                userId: userId,
                                categoryImg: categoryImage,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
