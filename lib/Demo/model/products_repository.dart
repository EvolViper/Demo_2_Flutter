import 'product.dart';

class ProductRepository{
  static List<Product> loadProducts(Category category){
    const allProducts = <Product>[
      Product(
          category: Category.delicious,
          id: 1,
          isFeatured: true,
          name: 'Chinese pizza',
          price: 59,
      ),
      Product(
        category: Category.fast,
        id: 2,
        isFeatured: true,
        name: 'Cheese pizza',
        price: 109,
      ),
      Product(
        category: Category.drug,
        id: 3,
        isFeatured: false,
        name: 'Vegetable pizza',
        price: 30,
      ),
      Product(
        category: Category.all,
        id: 4,
        isFeatured: false,
        name: 'Duck pizza',
        price: 1200,
      ),
      Product(
        category: Category.all,
        id: 5,
        isFeatured: false,
        name: 'Noice pizza',
        price: 15,
      ),
      Product(
        category: Category.delicious,
        id: 6,
        isFeatured: false,
        name: 'Veg pizza',
        price: 122,
      ),
      Product(
        category: Category.delicious,
        id: 7,
        isFeatured: false,
        name: 'Italian pizza',
        price: 70,
      ),
      Product(
        category: Category.drug,
        id: 8,
        isFeatured: false,
        name: 'Italian pizza',
        price: 70,
      ),
      Product(
        category: Category.drug,
        id: 9,
        isFeatured: false,
        name: 'Italian pizza',
        price: 70,
      ),
      Product(
        category: Category.fast,
        id: 10,
        isFeatured: false,
        name: 'Italian pizza',
        price: 70,
      ),Product(
        category: Category.fast,
        id: 11,
        isFeatured: false,
        name: 'Italian pizza',
        price: 70,
      ),
    ];
    if (category == Category.all){
      return allProducts;
    } else {
      return allProducts.where((Product p){
        return p.category == category;
      }).toList();
    }
  }
}