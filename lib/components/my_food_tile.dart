import 'package:flutter/material.dart';

import '../models/food.dart';
class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )),
                      Text("\$${food.price}", style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                      SizedBox(height: 10),
                      Text(food.description,
                        style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                //Image
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(food.imagePath, height: 120,fit: BoxFit.cover, width: 120,)

                )
              ],
            ),
          ),
        ),
        Divider(
          indent: 25,
          endIndent: 25,
          color: Theme.of(context).colorScheme.primary,
        )
      ],);
  }
}
