import 'package:flutter/material.dart';
import 'package:rest_or_rant/screens/restaurant.dart';
import 'package:rest_or_rant/screens/utils/routing.dart';

class RestaurantCard extends StatelessWidget {
  final restaurant;
  final index;
  const RestaurantCard(
      {super.key, required this.restaurant, required this.index});

  final double avatarHeight = 100;
  final double avatarWidgth = 150;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushRoute(context, Restaurant(index: index, restaurant: restaurant));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Hero(
              tag: "${restaurant["restaurantName"]} image",
              child: Container(
                clipBehavior: Clip.antiAlias,
                constraints: BoxConstraints(minHeight: avatarHeight),
                width: avatarWidgth,
                height: avatarHeight,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Image.network(
                  restaurant["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(restaurant["restaurantName"]),
                subtitle: Text(restaurant["cuisineType"]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
