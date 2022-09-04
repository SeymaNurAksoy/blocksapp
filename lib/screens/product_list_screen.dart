
import 'package:blocksample/blocs/cart_block.dart';
import 'package:blocksample/blocs/product_block.dart';
import 'package:blocksample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget{
// ProductBloc productBloc = ProductBloc();
  //CartBlock cartBlock = CartBlock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: <Widget>[
          IconButton(onPressed : ()=> Navigator.pushNamed(context, "/cart"),
          icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {

    return StreamBuilder(initialData: productBloc.getAll(),
    stream: productBloc.getStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return snapshot.data.length >0?buildProductListItems(snapshot):Center(child: Text("Data yok"),);
      },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    var list = snapshot.data;

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context,index){

      var list = snapshot.data;
      return ListTile(
        title: Text(list[index].name),
        subtitle: Text(list[index].price.toString()),
        trailing: IconButton(
          icon :Icon(Icons.shopping_cart),
        onPressed: (){
          cartBlock.addToCard(Cart(list[index],1));
        },),

      );
    });
  }

  
}