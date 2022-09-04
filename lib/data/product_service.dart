import 'package:blocksample/models/product.dart';

class ProductService{
  static List<Product> products = new List<Product>.empty(growable: true);

  static ProductService _singleton = ProductService._interval();
  //instance oluşturuyor factory aynı instance verir
  factory ProductService(){
    return _singleton;
  }
  ProductService._interval();

  static List<Product> getAll(){
    products.add(new Product(1, "Acer Laptop",70000));
    products.add(new Product(2, "Kalemlik",6547));
    products.add(new Product(3, "Klavye",785));
    products.add(new Product(4, "Kalem",12));
    return products;
  }
}