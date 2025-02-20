
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

class SvgImagePaths {
  static SvgImagePaths? _instance;
  static SvgImagePaths get instance {
    _instance ??= SvgImagePaths.init();
    return _instance!;
  }

  SvgImagePaths.init();

  final relaxSVG = "relax".toSVG;
  final devSVG = "dev".toSVG;
  final selfieSVG = "selfie".toSVG;
}
