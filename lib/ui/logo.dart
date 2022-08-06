import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/constants.dart';

SizedBox Logo(double aWidth) {
  return SizedBox(
    width: aWidth,
    height: 82,
    child: SvgPicture.asset(logo, height: 40, semanticsLabel: 'logo'),
  );
}
