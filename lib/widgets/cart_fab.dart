import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

import 'package:rest_or_rant/screens/utils/routing.dart';
import 'package:rest_or_rant/screens/utils/store.dart';
import 'package:rest_or_rant/screens/cart.dart';

class CartFAB extends StatelessWidget {
  const CartFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalStore globalStore = Get.put(GlobalStore());

    return Obx(
      () => Badge(
        showBadge: globalStore.cartCount > 0,
        animationDuration: const Duration(milliseconds: 500),
        badgeContent: Text(globalStore.cartCount.toString()),
        animationType: BadgeAnimationType.scale,
        badgeColor: Colors.lightGreenAccent,
        child: FloatingActionButton(
          onPressed: () {
            pushRoute(context, const Cart());
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
