import 'package:flutter/material.dart';

import '../views/cartPage.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [

        IconButton(
          onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage())),
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      title:  Text(
          "Sunset Diner",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1.0,
      ),
    );
  }
}
