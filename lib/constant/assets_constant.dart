part of constants;
class AssetsConstant{

  static final AssetsConstant _assetsConstant = AssetsConstant._internal();

  AssetsConstant._internal();

  factory AssetsConstant() {
    return _assetsConstant;
  }

  ///image
  final String imageSplash = 'assets/images/ic_launcher-playstore.png';

}
