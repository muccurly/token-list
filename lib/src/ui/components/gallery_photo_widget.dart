import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jurta_app/src/env_config.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.itemsUuid,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> itemsUuid;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.backgroundDecoration,
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - kToolbarHeight,
      ),
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: _buildItem,
        itemCount: widget.itemsUuid.length,
        loadingBuilder: widget.loadingBuilder,
        backgroundDecoration: widget.backgroundDecoration,
        pageController: widget.pageController,
        onPageChanged: onPageChanged,
        scrollDirection: widget.scrollDirection,
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final item = widget.itemsUuid[index];
    return PhotoViewGalleryPageOptions(
      imageProvider:
      CachedNetworkImageProvider('${EnvironmentConfig.API_URL_FM}'
          '/${EnvironmentConfig.API_VERSION}/download/$item'),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item),
    );
  }
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail({
    Key? key,
    required this.galleryExampleItem,
    required this.onTap,
  }) : super(key: key);

  final String galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          //TODO: make unique tag
            tag: galleryExampleItem,
            child: CachedNetworkImage(
              imageUrl: '${EnvironmentConfig.API_URL_FM}'
                  '/${EnvironmentConfig.API_VERSION}/download'
                  '/$galleryExampleItem',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => placeholders.shimmer,
              errorWidget: (context, url, error) =>
              placeholders.errorPlaceholder,
            )),
      ),
    );
  }
}
