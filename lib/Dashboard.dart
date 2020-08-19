import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:users/eachShop.dart';
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String userId;
  var _stream;
  List shopID;
  List shopName;
  List shopAddress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream=Firestore.instance.collection("merchants").snapshots();
    getUserId();
  }
  getUserId() async{
    final user =await FirebaseAuth.instance.currentUser();
    userId= await user.uid;
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mohalla Shops"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context,snapshot){
          if(snapshot.hasData){
            shopName=[];
            shopID=[];
            shopAddress=[];
            final shops = snapshot.data.documents;
            for(var eachShop in shops){

               shopID.add(eachShop.documentID);
               shopName.add(eachShop.data['sn']);
               shopAddress.add(eachShop.data['a']);



            }
            print(shopID);
            return ListView.builder(
              itemCount: shopName.length,
              itemBuilder: (context,index){
                return FlatButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EachShop(Id:shopID[index],name: shopName[index],address: shopAddress[index],userId: userId,)));
                    },
                    child: Text(shopName[index]));
              },
            );

          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
