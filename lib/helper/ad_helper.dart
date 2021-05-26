import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9548270312571067/2033447768";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9548270312571067/5811381996";
    }  else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
