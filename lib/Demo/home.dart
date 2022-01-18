import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'package:intl/intl.dart';
import 'package:demo_2_flutter/Demo/supplemental/asymmetric_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.category = Category.all}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
       products: ProductRepository.loadProducts(category),
       );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('FISH'),
    //     leading: IconButton(
    //       onPressed: () {
    //         print('Menu Here');
    //       },
    //       icon: const Icon(
    //         Icons.menu,
    //         semanticLabel: 'menu',
    //       ),
    //     ),
    //     actions: <Widget>[
    //       IconButton(
    //         onPressed: () {
    //           print('Search Button');
    //         },
    //         icon: const Icon(Icons.search, semanticLabel: 'search'),
    //       ),
    //       IconButton(
    //           onPressed: () {
    //             print('Filter button');
    //           },
    //           icon: const Icon(
    //             Icons.tune,
    //             semanticLabel: 'filter',
    //           )),
    //     ],
    //   ),
    //   // Add a gid view
    //   body: GridView.count(
    //     crossAxisCount:
    //         2, // chỉ định số lượng các mặt hàng sẽ xuất hiện trên app
    //     padding: const EdgeInsets.all(16.0),
    //     // calculates each child's width ([width of entire grid] - [left padding] - [right padding]) / 2
    //     // => ([width of entire grid] - 16 - 16 / 2)
    //     childAspectRatio: 8.0 / 9.0, // khai báo kích cỡ khung của các mặt hàng
    //     // Build a grid of card
    //     children: _buildGridCards(context), // call _buildGridCards function to get list of card
    //
    //   ),
    //   // resizeToAvoidBottomInset: false,
    // body: AsymmetricView(
    //     //   //   products: ProductRepository.loadProducts(Category.all),
    //     //   // ),
    // );
  }

  // remember that functions starting with an underscore are private API
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0, // loại bỏ cái hàng shadow bên dưới mỗi mặt hàng
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fill,
                // package: product.assetPackage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Future<InitializationStatus> _initGoogleMobileAds(){
    return MobileAds.instance.initialize();
  }


}
