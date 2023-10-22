import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Extensions on int {
  double get sp => ScreenUtil().setSp(this);
}