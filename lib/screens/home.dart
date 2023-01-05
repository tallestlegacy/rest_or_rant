import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rest_or_rant/screens/account.dart';
import 'package:rest_or_rant/screens/onboard.dart';
import 'package:rest_or_rant/screens/utils/routing.dart';
import 'package:rest_or_rant/screens/utils/store.dart';
import 'package:rest_or_rant/widgets/cart_fab.dart';
import 'package:rest_or_rant/widgets/restaurant_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalStore globalStore = Get.put(GlobalStore());

    return Scaffold(
      body: Obx(
        () => !globalStore.onBoarded.value
            ? const OnBoard()
            : Scaffold(
                appBar: AppBar(
                  title: const Text("Rest or Rant"),
                  actions: [
                    IconButton(
                      onPressed: () => pushRoute(context, const Account()),
                      icon: const Icon(Icons.settings),
                    )
                  ],
                ),
                body: ListView.separated(
                  itemBuilder: (context, index) => RestaurantCard(
                    restaurant: globalStore.restaurants[index],
                    index: index,
                  ),
                  itemCount: globalStore.restaurants.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
                floatingActionButton: const CartFAB(),
              ),
      ),
    );
  }
}
