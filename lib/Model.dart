import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel{
  final String uid;
  CustomerModel({this.uid});
  
  final CollectionReference customerCollection = Firestore.instance.collection('customers');
  Future updateMerchantData(String shopname, String address) async{
    return await customerCollection.document(uid).setData({
      'sn':shopname,
      'a':address

    });
  }
}

/*class ProductModel{
  final String merchantUID;
  ProductModel({this.merchantUID});
  final CollectionReference merchantCollection = Firestore.instance.collection('merchants');
  Future addProduct(String title,String des, int price, int quantity)async{
    return await Firestore.instance.collection('products').add({
      "mId":merchantUID,
      "t":title,
      "d":des,
      "q":quantity,
      "p":price
    }).then((value) async{
      return await merchantCollection.document(merchantUID).updateData({
        'products': FieldValue.arrayUnion([value.documentID]),

      });
    });
  }
}*/