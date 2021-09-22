import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//TODO: change colors
<<<<<<< HEAD
final placeholderColor = Colors.blue[300]!;
final highlightColor = Colors.blue[100]!;

final shimmer = Shimmer.fromColors(
  baseColor: placeholderColor,
  highlightColor: highlightColor,
  child: Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.white,
=======
final color1 = Colors.grey[300]!;
final color2 = Colors.grey[100]!;

Widget _buildBaseShimmer({
  double width = double.infinity,
  double height = double.infinity,
}) {
  return Shimmer.fromColors(
    child: Container(
      width: width,
      height: height,
      color: Colors.white,
    ),
    baseColor: color1,
    highlightColor: color2,
  );
}

final shimmer = _buildBaseShimmer();

final gridShimmer = Container(
  width: 170,
  height: 300,
  child: Column(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _buildBaseShimmer(height: 214)),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _buildBaseShimmer(height: 30)),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _buildBaseShimmer(height: 20)),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: _buildBaseShimmer(height: 20)),
      ),
    ],
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  ),
);

final errorPlaceholder = Container(
  width: double.infinity,
  height: double.infinity,
  child: Image.asset(
    'assets/images/404.png',
    fit: BoxFit.cover,
    colorBlendMode: BlendMode.multiply,
<<<<<<< HEAD
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
=======
    color: color1,
  ),
);

final noImagePlc = Container(
  width: double.infinity,
  height: double.infinity,
  child: Image.asset(
    'assets/images/no_image.png',
    fit: BoxFit.cover,
    colorBlendMode: BlendMode.multiply,
    color: Colors.blue[300]!,
  ),
);

final noImagePlaceholder = Image.asset('assets/images/no_image.png');

final objectTypesDropDownPlaceholder = _buildBaseShimmer(height: 40);
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
