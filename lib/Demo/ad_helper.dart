import 'dart:io';

class AdHelper{
  static String get bannerAdUnit{
    if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-9422127720712531/2695137481";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
  //
  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-9422127720712531/2695137481";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
}