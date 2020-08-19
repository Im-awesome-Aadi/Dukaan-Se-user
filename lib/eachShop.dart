import 'package:flutter/material.dart';
import 'package:users/getProducts.dart';
class EachShop extends StatefulWidget {
  EachShop({this.Id,this.name,this.userId,this.address});
  final Id;
  final name;
  final userId;
  final address;
  @override
  _EachShopState createState() => _EachShopState();
}

class _EachShopState extends State<EachShop> {
  List<String> productTitle;
  List<int> productAmount;
  List<int> productQuantity;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getData();
  }
  getData() async{
    print('merchants/${widget.Id}/products');
    var a=await GetProduct(merchantID: widget.Id).getProductData();
    print(a);
   /* for (var i in a){
      print(i['t']);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: <Widget>[
          Text("${widget.address}"),
          FutureBuilder(
            future:GetProduct(merchantID: widget.Id).getProductData() ,
            builder: (context,snapshot){
              if(snapshot.hasData){
                productAmount=[];
                productTitle=[];
                productQuantity=[];
                for (var i in snapshot.data){
                  productAmount.add(i['p']);
                  productQuantity.add(i['q']);
                  productTitle.add(i['t']);

                }
                return ListView.builder(
                  shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: productTitle.length,
                    itemBuilder: (builder,index){
                     return Text("${productTitle[index]}");
                });
              }
              return CircularProgressIndicator();
            }
          )
        ],
      ),

    );
  }
}
