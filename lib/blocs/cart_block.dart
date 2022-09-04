import 'dart:async';

import 'package:blocksample/data/cart_service.dart';
import 'package:blocksample/models/cart.dart';

class CartBlock{
  //future asenkron yapı
  final cartStreamController = StreamController.broadcast();
  
  Stream get getStream => cartStreamController.stream;
  
  void addToCard(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCard(Cart item){
    CartService.removeToCart(item);
    cartStreamController.sink.add((CartService.getCart()));
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }

}
final cartBlock = CartBlock();
