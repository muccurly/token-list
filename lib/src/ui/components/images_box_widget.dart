import 'package:flutter/material.dart';
import 'package:jurta_app/src/ui/components/gallery_photo_widget.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:jurta_app/src/utils/placeholders.dart' as placeholders;

class ImagesBoxWidget extends StatefulWidget {
  ImagesBoxWidget({
    Key? key,
    required this.list,
    required this.id,
  }) : super(key: key);

  final List<String> list;
  final int id;

  @override
  _ImagesBoxWidgetState createState() => _ImagesBoxWidgetState();
}

class _ImagesBoxWidgetState extends State<ImagesBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: 300,
      decoration: BoxDecoration(),
      child: widget.list.isEmpty
          ? placeholders.noImagePlaceholder
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: widget.list.isEmpty
                              ? placeholders.noImagePlaceholder
                              : GalleryExampleItemThumbnail(
                                  galleryExampleItem:
                                      widget.list.first,
                                  onTap: () async => await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          Colors.black.withOpacity(.8),
                                      context: context,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 15,15, 0),
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context).size.height,
                                                child: GalleryPhotoViewWrapper(
                                                  itemsUuid: widget.list,
                                                  backgroundDecoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  initialIndex: 0,
                                                  scrollDirection: Axis.horizontal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ))
                    ],
                  ),
                ),
                widget.list.length > 1
                    ? Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: widget.list.length >
                                        1
                                    ? GalleryExampleItemThumbnail(
                                        galleryExampleItem:
                                            widget.list[1],
                                        onTap: () async =>
                                            await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor: Colors.black
                                                    .withOpacity(.8),
                                                context: context,
                                                builder: (context) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.fromLTRB(0, 15,15, 0),
                                                            child: Align(
                                                              alignment: Alignment.topRight,
                                                              child: Icon(
                                                                Icons.close,
                                                                color: Colors.white,
                                                                size: 25,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .height,
                                                          child:
                                                              GalleryPhotoViewWrapper(
                                                            itemsUuid: widget.list,
                                                            backgroundDecoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.transparent,
                                                            ),
                                                            initialIndex: 1,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                      )
                                    : placeholders.noImagePlaceholder),
                            widget.list.length > 2
                                ? Expanded(
                                    child: widget.list
                                                .length >
                                            2
                                        ? GalleryExampleItemThumbnail(
                                            galleryExampleItem: widget.
                                                list[2],
                                            onTap: () async =>
                                                await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor: Colors
                                                        .black
                                                        .withOpacity(.8),
                                                    context: context,
                                                    builder: (context) {
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Padding(
                                                                padding: const EdgeInsets.fromLTRB(0, 15,15, 0),
                                                                child: Align(
                                                                  alignment: Alignment.topRight,
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: Colors.white,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height,
                                                              child:
                                                                  GalleryPhotoViewWrapper(
                                                                itemsUuid: widget.list,
                                                                backgroundDecoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
                                                                initialIndex: 2,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                          )
                                        : placeholders.noImagePlaceholder)
                                : SizedBox.shrink(),
                          ],
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
    );
  }
}
