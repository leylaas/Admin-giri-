import 'package:flutter/material.dart';
import 'package:shopsmart_admin_en_two/models/product_model.dart';
import 'package:shopsmart_admin_en_two/services/firebase_service.dart';
import '../../../services/assets_manager.dart';
import '../../../widgets/empty_bag.dart';
import '../../../widgets/title_text.dart';
import 'orders_widget.dart';

class OrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreenFree({Key? key}) : super(key: key);

  @override
  State<OrdersScreenFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersScreenFree> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(
            label: 'Verilen Sipariş',
          ),
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: FirebaseService.instance.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return isEmptyOrders
                  ? EmptyBagWidget(
                      imagePath: AssetsManager.order,
                      title: "Sipariş bulunamadı",
                      subtitle: "",
                    )
                  : ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                          child: OrdersWidgetFree(productModel: snapshot.data![index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
            }));
  }
}
