import 'package:flutter/material.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class StreetSearch extends StatefulWidget {
  StreetSearch({Key? key, required this.streets,
  required this.onChoice}) : super(key: key);

  final List<Address> streets;
  final Function(Address a) onChoice;

  @override
  _StreetSearch createState() => _StreetSearch();
}

class _StreetSearch extends State<StreetSearch> {
  final TextEditingController _streetController = new TextEditingController();

  late List<Address> filtered;
  @override
  void initState() {
    filtered = widget.streets;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                          width: 0,
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: TextField(
                          controller: _streetController,
                          decoration: InputDecoration(
                            hintText: '   Улица',
                            hintStyle:
                            const TextStyle(color: const Color(0xFFADADAD)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (v) {
                            if(v.isNotEmpty) {
                              setState(() {
                                filtered = filtered.where((e) =>
                                    e.address!.addressObject.name.nameRu
                                        .toLowerCase().contains(
                                        _streetController.text)).toList();
                              });
                            }
                            else {
                              filtered = widget.streets;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: filtered.length,
                  itemBuilder: (context, listViewIndex) {
                    final street = filtered[listViewIndex];
                    return InkWell(
                      onTap: (){
                        widget.onChoice(street);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                        child: Text(street
                            .address!
                            .addressObject
                            .name
                            .nameRu),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
