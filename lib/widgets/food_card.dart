import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rest_or_rant/screens/utils/store.dart';

class FoodCard extends StatelessWidget {
  final foodItem;
  const FoodCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final GlobalStore globalStore = Get.put(GlobalStore());
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            constraints: const BoxConstraints(minHeight: 100),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Image.network(
              foodItem["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(foodItem["name"]),
              subtitle: Text("Ksh. ${foodItem["price"]}"),
            ),
          ),
          Obx(
            () => Container(
                margin: const EdgeInsets.all(8),
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: globalStore.inCart(foodItem)
                      ? Colors.redAccent
                      : Colors.greenAccent,
                ),
                child: IconButton(
                  color: globalStore.inCart(foodItem)
                      ? Colors.white
                      : Colors.green[700],
                  onPressed: () {
                    globalStore.updateCart(foodItem);
                  },
                  icon: Icon(
                    globalStore.inCart(foodItem) ? Icons.remove : Icons.add,
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  final foodItem;
  final int index;
  const CartCard({super.key, required this.foodItem, required this.index});

  @override
  Widget build(BuildContext context) {
    final GlobalStore globalStore = Get.put(GlobalStore());
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            constraints: const BoxConstraints(minHeight: 100),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Image.network(
              foodItem["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(foodItem["name"]),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ksh. ${foodItem["price"]}"),
                  TextButton(
                    onPressed: () {
                      globalStore.updateCart(foodItem);
                    },
                    style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text("Remove"),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    globalStore.incrementAt(index);
                  },
                  icon: const Icon(Icons.add)),
              Text(foodItem["quantity"].toString()),
              IconButton(
                  onPressed: () {
                    globalStore.decrementAt(index);
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
