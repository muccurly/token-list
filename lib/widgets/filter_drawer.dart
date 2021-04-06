import 'package:flutter/material.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class FilterDrawer extends StatefulWidget {
  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  TextEditingController _priceFromC;
  TextEditingController _priceToC;
  TextEditingController _areaFromC;
  TextEditingController _areaToC;
  String _selectedHouseType;
  String _selectedRoom;

  @override
  void initState() {
    super.initState();
    _priceFromC = TextEditingController();
    _priceToC = TextEditingController();
    _areaFromC = TextEditingController();
    _areaToC = TextEditingController();
  }

  @override
  void dispose() {
    _priceFromC.dispose();
    _priceToC.dispose();
    _areaFromC.dispose();
    _areaToC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notch = MediaQuery.of(context).viewPadding.top;

    return Theme(
      data:
          Theme.of(context).copyWith(canvasColor: Style.blue.withOpacity(0.5)),
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            SizedBox(height: notch + 20),

            /// house type title
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'ТИП НЕДВИЖИМОСТИ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),

            /// house type dropdown
            Container(
              height: 36,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey.shade300,
                ),
              ),
              child: DropdownButton<String>(
                focusColor: Colors.white,
                dropdownColor: Colors.white,
                value: _selectedHouseType,
                //elevation: 5,
                style: TextStyle(color: Style.blue),
                isDense: true,
                isExpanded: true,
                underline: SizedBox.shrink(),
                iconEnabledColor: Style.blue,
                icon: Icon(
                  LineIcons.angleDown,
                  size: 16,
                ),
                items: HOUSE_TYPE.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Style.blue,
                        // fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  'Тип недвижимости',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    _selectedHouseType = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            /// rooms title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'КОМНАТНОСТЬ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),

            /// rooms select
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...ROOMS.map(
                      (room) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRoom = room;
                              });
                            },
                            child: Container(
                              height: 36,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: _selectedRoom == room
                                    ? Style.orange
                                    : Colors.white,
                                border: Border.all(
                                  width: 0.5,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  room,
                                  style: TextStyle(
                                    color: _selectedRoom == room
                                        ? Colors.white
                                        : null,
                                    fontWeight: _selectedRoom == room
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'ДИАПАЗОН ЦЕН, Т',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),

            /// price fields
            Row(
              children: [
                /// price from
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextFormField(
                      controller: _priceFromC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'От',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
                const SizedBox(width: 4),

                /// price to
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: TextFormField(
                      controller: _priceToC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'До',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// area title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'ПЛОЩАДЬ, М\u00B2',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),

            /// area fields
            Row(
              children: [
                /// area from
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextFormField(
                      controller: _areaFromC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'От',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                /// area to
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: TextFormField(
                      controller: _areaToC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 0.5,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'До',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// cancel button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Отмена',
                  style: TextStyle(
                    color: Style.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 8),

            /// show button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ПОКАЗАТЬ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Style.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}