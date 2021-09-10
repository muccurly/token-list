import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//TODO: change colors
final placeholderColor = Colors.blue[300]!;

final shimmer = Shimmer.fromColors(
  baseColor: placeholderColor,
  highlightColor: Colors.blue[100]!,
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