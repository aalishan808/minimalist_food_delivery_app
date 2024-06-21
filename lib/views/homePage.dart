import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description_box.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_sliver_app_bar.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_food_tile.dart';
import '../models/food.dart';
import 'foodPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  //sort out and return a list of food items based on the category
  List<Food> _filterFoodByCategory(FoodCategories category, List<Food> foodMenu) {
    return foodMenu.where((food) => food.category == category).toList();
  }

  // return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fulMenu){
    return FoodCategories.values.map((category){
      List<Food> categoryMenu = _filterFoodByCategory(category, fulMenu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            final food = categoryMenu[index];
            return FoodTile(
              food: food,
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food,)))
            );
          }
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>[
           MySliverAppBar(
             title:MyTabBar(tabController: _tabController),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Divider(
                   indent:  25,
                     endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary),
                  //my current locaiton
                   MyCurrentLocation(),
                 //descripiton box
                 const MyDescriptionBox()
               ],
             ),
           )

        ], body:Consumer<Restaurant>(builder: (context, restaurant, child){
          return TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          );
        }
        )
        )

    );
  }
}
