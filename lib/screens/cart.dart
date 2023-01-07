import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_or_rant/screens/utils/store.dart';
import 'package:rest_or_rant/widgets/food_card.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalStore globalStore = Get.put(GlobalStore());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          actions: [
            Obx(
              () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: globalStore.cartCount > 0
                        ? Text("Total : Ksh. ${globalStore.cartTotal}")
                        : null,
                  )),
            )
          ],
        ),
        body: Obx(
          () => globalStore.cartCount == 0
              ? const Center(
                  child: Text("Cart is empty"),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartCard(
                            foodItem: globalStore.cart[index], index: index),
                        itemCount: globalStore.cart.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text("CHECKING OUT"),
                                  content: Text(
                                      "Total: Ksh ${globalStore.cartTotal}"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          globalStore.checkoutCart();
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Make Payment")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                  ],
                                ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Center(child: Text("CHECKOUT")),
                      ),
                    )
                  ],
                ),
        ));
  }
}
