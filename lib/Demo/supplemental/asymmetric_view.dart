import 'package:flutter/material.dart';

import 'package:demo_2_flutter/Demo/model/product.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper.dart';
import 'product_columns.dart';

class AsymmetricView extends StatefulWidget {
  final List<Product> products;

  const AsymmetricView({Key? key, required this.products}) : super(key: key);

  @override
  State<AsymmetricView> createState() => _AsymmetricViewState();
}

class _AsymmetricViewState extends State<AsymmetricView> {
  // Add _bannerAd
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnit,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_){
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err){
          print('Failed to load a banner ad :${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  List<Widget> _buildColumns(BuildContext context) {
    if (widget.products.isEmpty) {
      return <Container>[];
    }

    /// This will return a list of columns. It will oscillate between the two
    /// kinds of columns. Even cases of the index (0, 2, 4, etc) will be
    /// TwoProductCardColumn and the odd cases will be OneProductCardColumn.
    ///
    /// Each pair of columns will advance us 3 products forward (2 + 1). That's
    /// some kinda awkward math so we use _evenCasesIndex and _oddCasesIndex as
    /// helpers for creating the index of the product list that will correspond
    /// to the index of the list of columns.
    return List.generate(_listItemCount(widget.products.length), (index) {
      double width = .60 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        // Even Cases
        int bottom = _evenCasesIndex(index);
        column = TwoProductCardColumn(
            bottom: widget.products[bottom],
            top: widget.products.length - 1 >= bottom + 1
                ? widget.products[bottom + 1]
                : null);
        width += 32.0;
      } else {
        /// Odd case
        column = OneProductCardColumn(
          product: widget.products[_oddCasesIndex(index)],
        );
      }
      return SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: column,
        ),
      );
    }).toList();
  }=

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          if (_isBannerAdReady)
      Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd),
      ),
    ),
          ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
            children: _buildColumns(context),
          ),
        ],
      ),
    );
  }
}
