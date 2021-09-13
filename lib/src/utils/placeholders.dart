import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//TODO: change colors
final placeholderColor = Colors.blue[300]!;
final highlightColor = Colors.blue[100]!;

final shimmer = Shimmer.fromColors(
  baseColor: placeholderColor,
  highlightColor: highlightColor,
  child: Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.white,
  ),
);

final errorPlaceholder = Container(
  width: double.infinity,
  height: double.infinity,
  child: Image.asset(
    'assets/images/404.png',
    fit: BoxFit.cover,
    colorBlendMode: BlendMode.multiply,
    color: placeholderColor,
  ),
);

final noImagePlaceholder = Image.asset('assets/images/no_image.png');

final objectTypesDropDownPlaceholder = Shimmer.fromColors(
  baseColor: placeholderColor,
  highlightColor : highlightColor,
  child: Container(
    width: double.infinity,
    height: 40,
    color: Colors.white,
  ),
);