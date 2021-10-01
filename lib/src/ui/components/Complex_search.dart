import 'package:flutter/material.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
import 'package:jurta_app/src/ui/flutter_flow/flutter_flow_theme.dart';

class ComplexSearch extends StatefulWidget {
  ComplexSearch({Key? key, required this.complex,
  required this.onChoice}) : super(key: key);

  final List<ResidentialComplex> complex;
  final Function(ResidentialComplex a) onChoice;

  @override
  _ComplexSearch createState() => _ComplexSearch();
}

class _ComplexSearch extends State<ComplexSearch> {
  final TextEditingController _complexController = new TextEditingController();

  late List<ResidentialComplex> filtered;
  @override
  void initState() {
    filtered = widget.complex;
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
                          controller: _complexController,
                          decoration: InputDecoration(
                            hintText: '   ЖК',
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
                                    e.name!
                                        .toLowerCase()
                                        .contains(
                                        _complexController
                                            .text
                                            .toLowerCase())).toList();
                              });
                            }
                            else {
                              filtered = widget.complex;
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
                    final complex = filtered[listViewIndex];
                    return InkWell(
                      onTap: (){
                        widget.onChoice(complex);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8,0, 0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                          child: Text(complex.name!.toLowerCase()),
                        ),
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
