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
  List<bool> _selectedRooms = List<bool>.generate(ROOMS.length, (_) => false);
  bool _hot = false;
  bool _new = false;

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
    return Theme(
      data:
          Theme.of(context).copyWith(canvasColor: Style.blue.withOpacity(0.5)),
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(12.0),
          children: [
            SizedBox(height: Global.getViewPadding(context).top + 20),

            /// hot, new switch
            Row(
              children: [
                /// hot
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _hot = !_hot);
                      },
                      child: TextFormField(
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
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Горящие',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          isDense: true,
                          suffixIcon: Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: _hot,
                              onChanged: (val) => setState(() => _hot = val),
                              activeColor: Style.orange,
                              inactiveThumbColor: Style.blue,
                            ),
                          ),
                          enabled: false,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),

                /// new
                Expanded(
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => _new = !_new);
                      },
                      child: TextFormField(
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
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 0.5,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Новые',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          isDense: true,
                          suffixIcon: Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: _new,
                              onChanged: (val) => setState(() => _new = val),
                              activeColor: Style.orange,
                              inactiveThumbColor: Style.blue,
                            ),
                          ),
                          enabled: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

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
                style: TextStyle(color: Style.blue, fontSize: 13),
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  'Тип недвижимости',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
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
                    children: List<Widget>.generate(ROOMS.length, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRooms[index] = !_selectedRooms[index];
                            });
                          },
                          child: Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: _selectedRooms[index]
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
                                ROOMS[index],
                                style: TextStyle(
                                    color: _selectedRooms[index]
                                        ? Colors.white
                                        : null,
                                    fontWeight: _selectedRooms[index]
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                    fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ),
            const SizedBox(height: 24),

            /// price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'ДИАПАЗОН ЦЕН,',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        )),
                    TextSpan(
                      text: ' ₸',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
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
                          fontSize: 13,
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
                          fontSize: 13,
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
                          fontSize: 13,
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
                          fontSize: 13,
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
