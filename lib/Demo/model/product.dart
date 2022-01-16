enum Category { all, fast, drug, delicious, }

class Product{
  const Product({
       required this.category, required this.id, required this.isFeatured, required this.name, required this.price
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  String get assetName => 'assets/images/$id.jpg';
  // String get assetPackage => 'shrine_images';

  @override
  String toString() => '$name (id=$id)';
}
