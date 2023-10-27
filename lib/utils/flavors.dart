

import '../constant/constants.dart';

enum Flavor {
  development,
  production,
  staging,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return stringConstant.development;
      case Flavor.production:
        return stringConstant.production;
      case Flavor.staging:
        return stringConstant.staging;
      default:
        return 'title';
    }
  }

}
