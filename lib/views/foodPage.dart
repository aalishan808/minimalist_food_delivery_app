import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';
class FoodPage extends StatefulWidget {
  final Food food;
   Map<Addon, bool> selectedAddons = {};
   FoodPage({
    super.key,

    required this.food,
  }){
     //initialize selectedAddons false
food.availableAddons.forEach((addon) {
      selectedAddons[addon] = false;
    });

   }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    //get the selected addons
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
    //add the food to the cart
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //food image
                Image.asset(widget.food.imagePath, height: 300, width: double.infinity, fit: BoxFit.cover,),
                //food name
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(widget.food.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary
                        ),),
                      //food description
                      Text(widget.food.description,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary
                        ),),
                      //food price
                      Text("\$ ${widget.food.price}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary
                        ),),
                      const SizedBox(height: 10,),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 10,),

                      //Adons
                      Text("Add-ons",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold
                        ),),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context,index) {
                              //get individual addons
                              Addon addon = widget.food.availableAddons[index];
                              //return a checkbox list tile
                              return CheckboxListTile(
                                  title: Text(addon.name, style: TextStyle(
                                      color: Theme.of(context).colorScheme.inversePrimary

                                  ),),
                                  subtitle: Text("\$ ${addon.price}", style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary
                                  )),
                                  value: widget.selectedAddons[addon],
                                  onChanged:
                                      (bool? value){
                                    setState((){
                                      widget.selectedAddons[addon] = value!;
                                    });
                                  }
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(onTap: ()=>addToCart(widget.food, widget.selectedAddons), text: "Add to Cart",),
                const SizedBox(height: 25,),

              ],
            ),
          ),
          //back button
          SafeArea(
            child: Opacity(
              opacity: 0.6,
              child: Container(
                  margin: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: ()=> Navigator.pop(context),
                )
              ),
            ),
          )
        ],
      )
    );
  }
}
