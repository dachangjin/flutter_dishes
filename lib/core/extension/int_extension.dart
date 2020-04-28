import 'package:favoritecake/ui/shared/size_fit.dart';

extension SizeFitOfInt on int {
  double get px {
    return SizeFit.getPx(this.toDouble());
  }

  double get rpx {
    return SizeFit.getRpx(this.toDouble());
  }
}