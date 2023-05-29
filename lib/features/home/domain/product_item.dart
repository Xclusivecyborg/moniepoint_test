class ProductItem {
  final List<String> imagesUrls;
  final String category;
  final String name;
  final String price;
  final String rating;
  final String designer;
  final String condition;
  final String weight;
  final String color;
  final String material;
  List<String> fullDescription;
  final String shipping;
  final String delivery;
  final String arrive;
  ProductItem({
    required this.imagesUrls,
    required this.category,
    required this.name,
    required this.price,
    required this.rating,
    required this.designer,
    required this.condition,
    required this.weight,
    required this.color,
    required this.material,
    required this.fullDescription,
    required this.shipping,
    required this.delivery,
    required this.arrive,
  });
}
