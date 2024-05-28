import 'package:flutter/material.dart';
import 'package:shopsmart_admin_en_two/screens/edit_upload_product_form.dart';
import 'package:shopsmart_admin_en_two/screens/inner_screens/orders/orders_screen.dart';
import 'package:shopsmart_admin_en_two/screens/search_screen.dart';


import '../services/assets_manager.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(context) => [
        DashboardButtonsModel(
          text: "Ürün ekle",
          imagePath: AssetsManager.cloud,
          onPressed: () {
            Navigator.pushNamed(context,EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "Ürünleri incele",
          imagePath: AssetsManager.shoppingCart,
          onPressed: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "Siparişler",
          imagePath: AssetsManager.order,
          onPressed: () {
            Navigator.pushNamed(context, OrdersScreenFree.routeName);
          },
        ),
      ];
}

