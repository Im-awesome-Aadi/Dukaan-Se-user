import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class GetProduct{
  GetProduct({this.merchantID});
  final String merchantID;
  List eachProduct=[];
  Future <List> getProductData() async{
    var productCollection = await  Firestore.instance.collection('merchants').document(merchantID).get();
    print(productCollection.data['products']);
   if(productCollection.data['products']!=null){
     for ( var i in productCollection.data['products']){
       eachProduct.add(await  Firestore.instance.collection('products').document(i).get());
       print(eachProduct);
     }
     return eachProduct;
   }
   else{
     eachProduct.add("No Item Found");
   }
   return eachProduct;
   }
}