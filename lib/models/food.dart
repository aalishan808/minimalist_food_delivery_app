//Food items
class Food{
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final FoodCategories category;
  List<Addon> availableAddons;
  Food({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.category,
    required this.availableAddons,
  });

}

//Food categories
enum FoodCategories{
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

//Food Addons
class Addon{
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}