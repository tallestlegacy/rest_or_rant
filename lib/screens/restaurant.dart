import 'package:flutter/material.dart';
import 'package:rest_or_rant/widgets/cart_fab.dart';
import 'package:rest_or_rant/widgets/food_card.dart';

class Restaurant extends StatelessWidget {
  final int index;
  final restaurant;
  const Restaurant({super.key, required this.index, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.large(
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "${restaurant["restaurantName"]} image",
                child: Image.network(
                  restaurant["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurant["restaurantName"],
                  style: TextStyle(
                      color: Colors.orange[900],
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "${restaurant["address"]}, ${restaurant["cityName"]}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const Divider(),
              for (var foodItem in restaurant["food"] ?? [])
                FoodCard(foodItem: foodItem),
              const SizedBox(height: 100)
            ]),
          ),
        ],
      ),
      floatingActionButton: const CartFAB(),
    );
  }
}
