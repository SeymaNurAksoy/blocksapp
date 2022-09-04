import 'package:blocksample/blocs/cart_block.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: StreamBuilder(
        stream: cartBlock.getStream,
        initialData: cartBlock.getCart(),
        builder: (context,snapshot){
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemBuilder: (BuildContext context,index)
    {
      final cart = snapshot.data;
      return ListTile(
        title: Text(cart[index].product.name),
        subtitle: Text(cart[index].product.price.toString()),
        trailing: IconButton(
          icon: Icon(Icons.remove_shopping_cart),
          onPressed: (){
            cartBlock.removeFromCard(cart[index]);
          },
        ),
      );
    },
      itemCount: snapshot.data.length,);

  }

}