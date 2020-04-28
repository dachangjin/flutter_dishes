import 'package:favoritecake/ui/shared/size_fit.dart';

extension SizeFitOfDouble on double{
  double get px {
    return SizeFit.getPx(this);
  }

  double get rpx {
    return SizeFit.getRpx(this);
  }
}