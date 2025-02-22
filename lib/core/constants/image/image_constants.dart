
class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get logo => toPng("logo");

  String get hotDog => toJpg("hotdog");

  String toPng(String path) =>"asset/image/$path.png";

  String toJpg(String path) =>"asset/image/$path.jpg";
}