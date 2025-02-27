import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble().h);

  SizedBox get pw => SizedBox(width: toDouble().w);
}
