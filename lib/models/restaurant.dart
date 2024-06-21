import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/cartItems.dart';
import 'package:intl/intl.dart';

import 'food.dart';
class Restaurant extends ChangeNotifier{

  // List of food items
  final List<Food> _menu = [
    //burgers
      Food(name: "Classic Cheeseburger",
          imagePath: "lib/images/burgers/chese_burger.jpg",
          description: "Juicy chese burger with fresh lettuce, tomato, and onion",
          price: 0.99,
          category: FoodCategories.burgers,
          availableAddons: [
            Addon(name: "Extra Cheese", price: 0.10),
            Addon(name: "Extra Patty", price: 0.99),
            Addon(name: "Bacon", price: 0.50),
          ]
        ,),
      Food(name: "BBQ burger",
          imagePath: "lib/images/burgers/bbq_burger.jpg",
          description: "Smocky BBQ burger with fresh lettuce, tomato, and onion",
          price: 1.99,
          category: FoodCategories.burgers,
          availableAddons: [
            Addon(name: "Grilled Onions", price: 0.10),
            Addon(name: "Jalepenos", price: 0.99),
            Addon(name: "Extra bbq sauce", price: 1.20),
          ],),

    Food(name: "Blue moon burger",
      imagePath: "lib/images/burgers/bluemoon_burger.png",
      description: "Blue cheese burger with fresh lettuce, tomato, and onion",
      price: 2.32,
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.10),
        Addon(name: "Extra Patty", price: 0.99),
        Addon(name: "Bacon", price: 0.50),
      ],),
    Food(name: "Aloha Burger",
      imagePath: "lib/images/burgers/aloha_burger.webp",
      description: "Juicy Aloha burger with fresh lettuce, tomato, and onion",
      price: 1.64,
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.10),
        Addon(name: "Extra Patty", price: 0.99),
        Addon(name: "Bacon", price: 0.50),
      ],),
    Food(name: "Vega Burger",
      imagePath: "lib/images/burgers/vega_burger.jpg",
      description: "Juicy chese burger with fresh lettuce, tomato, and onion",
      price: 1.99,
      category: FoodCategories.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.10),
        Addon(name: "Extra Patty", price: 0.99),
        Addon(name: "Bacon", price: 0.50),
      ],),
    //salads
    Food(name: "Fatoush Salad",
      imagePath: "lib/images/salads/fatoush_salad.jpeg",
      description: "Fresh Fatoush salad all the way from Lebanon",
      price: 1.44,
      category: FoodCategories.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchoives", price: 0.99),
        Addon(name: "Extra Parsemen", price: 0.50),
      ],),
    Food(name: "Greek Salad",
      imagePath: "lib/images/salads/greek salad.jpeg",
      description: "Fresh Greek salad all the way from Greece",
      price: 3.21,
      category: FoodCategories.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchoives", price: 0.99),
        Addon(name: "Extra Parsemen", price: 0.50),
      ],),
    Food(name: "Quinoa Salad",
      imagePath: "lib/images/salads/Quinoa salad.jpg",
      description: "Fresh Quiunoa salad all the way from Peru",
      price: 2.43,
      category: FoodCategories.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchoives", price: 0.99),
        Addon(name: "Extra Parsemen", price: 0.50),
      ],),
    Food(name: "Russian Salad",
      imagePath: "lib/images/salads/russian salad.webp",
      description: "Fresh Quiunoa salad all the way from Peru",
      price: 3.44,
      category: FoodCategories.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchoives", price: 0.99),
        Addon(name: "Extra Parsemen", price: 0.50),
      ],),
    Food(name: "Tabboulesh Salad",
      imagePath: "lib/images/salads/Tabbouleh Salad.jpeg",
      description: "Fresh Quiunoa salad all the way from Peru",
      price: 1.65,
      category: FoodCategories.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.10),
        Addon(name: "Anchoives", price: 0.99),
        Addon(name: "Extra Parsemen", price: 0.50),
      ],),
    //sides
    Food(name: "Air Fryer Broccoli",
      imagePath: "lib/images/sides/Air-Fryer-Broccoli.webp",
      description: "Fresh Air Fryer Broccoli.",
      price: 1.75,
      category: FoodCategories.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Truffle Oil", price: 0.99),
        Addon(name: "Spicy Mayo", price: 0.50),
      ],),

    Food(name: "Baked Sweet Potato",
      imagePath: "lib/images/sides/Baked-Sweet-Potato.webp",
      description: "Fresh Baked Sweet Potato.",
      price: 1.34,
      category: FoodCategories.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Truffle Oil", price: 0.99),
        Addon(name: "Spicy Mayo", price: 0.50),
      ],),

    Food(name: "Garlic Roasted Potatoes",
      imagePath: "lib/images/sides/Garlic-Roasted-Potatoes.webp",
      description: "Fresh Garlic Roasted Potatoes.",
      price: 1.53,
      category: FoodCategories.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Truffle Oil", price: 0.99),
        Addon(name: "Spicy Mayo", price: 0.50),
      ],),

    Food(name: "German Potato Salad",
      imagePath: "lib/images/sides/German-Potato-Salad.webp",
      description: "Fresh German potato salad.",
      price: 1.23,
      category: FoodCategories.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Truffle Oil", price: 0.99),
        Addon(name: "Spicy Mayo", price: 0.50),
      ],),

    Food(name: "Hummus",
      imagePath: "lib/images/sides/Hummus.webp",
      description: "Fresh Hummus.",
      price: 1.99,
      category: FoodCategories.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.10),
        Addon(name: "Olive Oil", price: 0.99),
        Addon(name: "Spicy Mayo", price: 0.50),
      ],),
    //deserts

    Food(name: "Baklawa",
      imagePath: "lib/images/desserts/baklawa.png",
      description: "Fresh sweet Baklawa.",
      price: 2.12,
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vannila ice cream ", price: 1.10),
        Addon(name: "Hot Fudge", price: 0.99),
        Addon(name: "Wipped Cream", price: 1.50),
      ],),
    Food(name: "Brownie",
      imagePath: "lib/images/desserts/brownie.jpg",
      description: "Sweet brownie taste like home.",
      price: 2.32,
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vannila ice cream ", price: 1.10),
        Addon(name: "Hot Fudge", price: 0.99),
        Addon(name: "Wipped Cream", price: 1.50),
      ],),

    Food(name: "Cheese Cake",
      imagePath: "lib/images/desserts/cheesecake.jpg",
      description: "Mouth watering cheese cake.",
      price: 1.32,
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vannila ice cream ", price: 1.10),
        Addon(name: "Hot Fudge", price: 0.99),
        Addon(name: "Wipped Cream", price: 1.50),
      ],),
    Food(name: "Gajar ka halwa",
      imagePath: "lib/images/desserts/gajar_halwa.jpg",
      description: "Fresh tasty gajar ka halwa prepared with traditional method.",
      price: 1.44,
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vannila ice cream ", price: 1.10),
        Addon(name: "Hot Fudge", price: 0.99),
        Addon(name: "Wipped Cream", price: 1.50),
      ],),
    Food(name: "Jalebi",
      imagePath: "lib/images/desserts/jalebi.jpg",
      description: "Fresh and tasty jalebi prepared with traditional method.",
      price: 1.33,
      category: FoodCategories.desserts,
      availableAddons: [
        Addon(name: "Vannila ice cream ", price: 1.10),
        Addon(name: "Hot Fudge", price: 0.99),
        Addon(name: "Wipped Cream", price: 1.50),
      ],),

    //drinks
    Food(name: "Barley Water",
      imagePath: "lib/images/drinks/barley_water.jpeg",
      description: "Fresh Barley Water.",
      price: 2.00,
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "sprinkle", price: 0.10),
        Addon(name: "sparkling water", price: 0.99),
        Addon(name: "lemon", price: 0.50),
      ],),
    Food(name: "Mango Lassi",
      imagePath: "lib/images/drinks/mango_lassi.jpeg",
      description: "Refreshing Mango Lassi.",
      price: 1.33,
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "sprinkle", price: 0.10),
        Addon(name: "sparkling water", price: 0.99),
        Addon(name: "lemon", price: 0.50),
      ],),
    Food(name: "Matcha",
      imagePath: "lib/images/drinks/matcha.jpg",
      description: "Fresh Matcha.",
      price: 1.00,
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "sprinkle", price: 0.10),
        Addon(name: "sparkling water", price: 0.99),
        Addon(name: "lemon", price: 0.50),
      ],),
    Food(name: "Mint Margarrita",
      imagePath: "lib/images/drinks/mint_margarita.jpeg",
      description: "Refreshing mint margarita.",
      price: 2.99,
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "sprinkle", price: 0.10),
        Addon(name: "sparkling water", price: 0.99),
        Addon(name: "lemon", price: 0.50),
      ],),
    Food(name: "Pina Colada",
      imagePath: "lib/images/drinks/pina_colada.jpg",
      description: "Refreshing pina colada.",
      price: 2.01,
      category: FoodCategories.drinks,
      availableAddons: [
        Addon(name: "sprinkle", price: 0.10),
        Addon(name: "sparkling water", price: 0.99),
        Addon(name: "lemon", price: 0.50),
      ],),

  ];
  //user cart
  final List<Cartitems> _cart = [];
  //delivery address (which user can change/update)
  String _deliveryAddress = "1234 Main Street, City, State, Zip Code";
  // G E T T E E R S
  List<Food> get menu => _menu;
  List<Cartitems> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;



// O P E R A T I O N S

//add to cart
void addToCart(Food food, List<Addon> selectedAddons){
  //check if there is already a cart item with the same food and selected addons
  Cartitems? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are the same
    bool isSameFood = item.food == food;
    //check if the list of selected addons are the same
    bool isSameAddons =
    const ListEquality().equals(item.selectedAddons, selectedAddons);
    return isSameFood && isSameAddons;
  }
  );


  //if item already exists increase it's quantity
  if(cartItem != null){
    cartItem.quantity++;
}
  else{
    _cart.add(
        Cartitems(
            food: food,
            selectedAddons: selectedAddons
        ),
    );

  }
notifyListeners();
}

//remove from cart
void removeFromCart(Cartitems cartItem){
 int cartIndex = _cart.indexOf(cartItem);
 if(cartIndex != -1){
   if(_cart[cartIndex].quantity > 1){
     _cart[cartIndex].quantity--;
   }
   else{
     _cart.removeAt(cartIndex);
   }
 }

  notifyListeners();
}
//get total price of cart
double getTotalPrice(){
  double total = 0.0;
  for(Cartitems cartItems in _cart){
    double itemTotal= cartItems.food.price;
    for(Addon addon in cartItems.selectedAddons){
      itemTotal += addon.price;
    }
    total+= itemTotal * cartItems.quantity;
  }
  return total;
}
//get total number of items in cart
int getTotalItemCount(){
  int totalItenCount = 0;
  for(Cartitems cartItems in _cart){
    totalItenCount += cartItems.quantity;
  }
  return totalItenCount;

}
//clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}
// H E L P E R S
// generate receipt
String displayCartReceipt() {
  final receipt = StringBuffer();
  receipt.writeln("Here is your receipt:");
  receipt.writeln();
  //format the date to include up to seconds only
  String formattedDate =
  DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("--------------------");
  for (final cartItems in _cart) {
    receipt.writeln(
        " ${cartItems.quantity} x ${cartItems.food.name} - ${_formatPrice(
            cartItems.food.price)}");
    if (cartItems.selectedAddons.isNotEmpty) {
      receipt.writeln("   Addons: ${_formatAddons(cartItems.selectedAddons)}");
    }
    receipt.writeln();
  }
  receipt.writeln("--------------------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
  receipt.writeln();
  receipt.writeln("Delivery Address: $deliveryAddress");

  return receipt.toString();

}
//format double value into money
String _formatPrice(double price){
  return "\$${price.toStringAsFixed(2)}";
}
//format list of addons into a string summary
String _formatAddons(List<Addon> addons){
return addons
    .map(
        (addon) => "${addon.name} (${_formatPrice(addon.price)})")
    .join(", ");
}
//update the delivery address
void updateDeliveryAddress(String newAddress) {
  _deliveryAddress = newAddress;
  notifyListeners();
}
}