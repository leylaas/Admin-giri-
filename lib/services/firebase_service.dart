import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_admin_en_two/models/product_model.dart';

class FirebaseService {
  FirebaseService._privateConstructor();
  static final FirebaseService instance = FirebaseService._privateConstructor();

  /// Save
  Future<void> saveProduct(ProductModel product) async {
    try {
      await FirebaseFirestore.instance.collection('orders').doc(product.productId).set({
        'productId': product.productId,
        'productTitle': product.productTitle,
        'productPrice': product.productPrice,
        'productCategory': product.productCategory,
        'productDescription': product.productDescription,
        'productImage': product.productImage,
        'productQuantity': product.productQuantity,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Get
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];
    try {
      final snapshot = await FirebaseFirestore.instance.collection('orders').get();
      snapshot.docs.forEach((doc) {
        products.add(ProductModel.fromFirestore(doc));
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return products;
  }
}
