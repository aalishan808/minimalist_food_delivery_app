import 'food.dart';
class Cartitems {
 Food food;
 List<Addon> selectedAddons;
 int quantity;
  Cartitems({
    required this.food,
    required this.selectedAddons,
    this.quantity=1,
  });
  double get totalPrice {
    double addonPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonPrice) * quantity;
  }
}