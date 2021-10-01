import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//TODO: change colors
final color1 = Colors.grey[300]!;
final color2 = Colors.grey[100]!;

Widget buildBaseShimmer({
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

final shimmer = buildBaseShimmer();

final gridShimmer = GridView.builder(
  padding: EdgeInsets.zero,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 0,
    childAspectRatio: .55,
  ),
  scrollDirection: Axis.vertical,
  itemCount: 4,
  itemBuilder: (context, index) => gridItemShimmer,
);

final gridItemShimmer = Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: 170,
    height: 300,
    child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: buildBaseShimmer(height: 212)),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: buildBaseShimmer(height: 30)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: buildBaseShimmer(height: 20)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: buildBaseShimmer(height: 20)),
        ),
      ],
    ),
  ),
);

final errorPlaceholder = Container(
  width: double.infinity,
  height: double.infinity,
  child: Image.asset(
    'assets/images/404.png',
    fit: BoxFit.cover,
    colorBlendMode: BlendMode.multiply,
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

final objectTypesDropDownPlaceholder = buildBaseShimmer(height: 40);
