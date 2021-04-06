import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _priceFromC;
  TextEditingController _priceToC;
  TextEditingController _areaFromC;
  TextEditingController _areaToC;
  TextEditingController _regionC;
  TextEditingController _streetC;
  TextEditingController _complexC;
  TextEditingController _yearFromC;
  TextEditingController _yearToC;
  TextEditingController _bargainFromC;
  TextEditingController _bargainToC;
  String _selectedHouseType = HOUSE_TYPE[0];
  String _selectedRoom = ROOMS[0];
  String _selectedHousePlan = HOUSE_PLANS[0];
  String _selectedHouseState = HOUSE_STATES[0];
  String _selectedRegion;
  String _selectedComplex;
  bool _bargain = false;
  bool _encumbrance = false;
  bool _exchange = false;
  bool _extendedSearch = false;

  @override
  void initState() {
    super.initState();
    _priceFromC = TextEditingController();
    _priceToC = TextEditingController();
    _areaFromC = TextEditingController();
    _areaToC = TextEditingController();
    _regionC = TextEditingController();
    _streetC = TextEditingController();
    _complexC = TextEditingController();
    _yearFromC = TextEditingController();
    _yearToC = TextEditingController();
    _bargainFromC = TextEditingController();
    _bargainToC = TextEditingController();
  }

  @override
  void dispose() {
    _priceFromC.dispose();
    _priceToC.dispose();
    _areaFromC.dispose();
    _areaToC.dispose();
    _regionC.dispose();
    _streetC.dispose();
    _complexC.dispose();
    _yearFromC.dispose();
    _yearToC.dispose();
    _bargainFromC.dispose();
    _bargainToC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notch = MediaQuery.of(context).viewPadding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: 12, vertical: notch > 0 ? notch : 16),
            children: [
              /// house type
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child:
                    // Row(
                    //   children: [
                    //   Expanded(
                    // child:
                    Text(
                  'ТИП НЕДВИЖИМОСТИ',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // ),
                // GestureDetector(
                //   onTap: _clearSearch,
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.search_off,
                //         size: 16,
                //       ),
                //       const SizedBox(width: 2),
                //       Text(
                //         'Очистить',
                //         style: TextStyle(
                //           fontSize: 11,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // ],
                // ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 28,
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    size: 12,
                  ),
                  items:
                      HOUSE_TYPE.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Style.blue,
                          fontSize: 11,
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    'Тип недвижимости',
                    style: TextStyle(
                      color: Colors.grey.shade300,
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
              const SizedBox(height: 16),

              /// room
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'КОМНАТНОСТЬ',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
                                child: Text(
                                  room,
                                  style: TextStyle(
                                    color: _selectedRoom == room
                                        ? Colors.white
                                        : null,
                                    fontSize: 11,
                                    fontWeight: _selectedRoom == room
                                        ? FontWeight.w500
                                        : FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
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
              const SizedBox(height: 16),

              /// price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'ДИАПАЗОН ЦЕН, Т',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
                            color: Colors.grey.shade300,
                            fontSize: 11,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          isDense: true,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

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
                            color: Colors.grey.shade300,
                            fontSize: 11,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          isDense: true,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              /// area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'ПЛОЩАДЬ, М\u00B2',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
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
                            color: Colors.grey.shade300,
                            fontSize: 11,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          isDense: true,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                            color: Colors.grey.shade300,
                            fontSize: 11,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          isDense: true,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /* AnimatedSwitcher(
                duration: Duration(milliseconds: 1),
                transitionBuilder: (child, animation) {
                  final offsetAnimation = Tween<Offset>(
                          begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
                      .animate(animation);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                child:*/
              _extendedSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// location
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'МЕСТОПОЛОЖЕНИЕ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// region
                        Container(
                          height: 28,
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            value: _selectedRegion,
                            //elevation: 5,
                            style: TextStyle(color: Colors.white),
                            isDense: true,
                            isExpanded: true,
                            underline: SizedBox.shrink(),
                            iconEnabledColor: Colors.grey,
                            icon: Icon(
                              LineIcons.angleDown,
                              size: 12,
                            ),
                            items: REGIONS
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                  ),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              'Район',
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 11,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _selectedRegion = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            /// street
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: TextFormField(
                                  controller: _streetC,
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
                                    hintText: 'Улица',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 11,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            /// complex
                            Expanded(
                              child: Container(
                                height: 28,
                                width: double.infinity,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                                  value: _selectedComplex,
                                  //elevation: 5,
                                  style: TextStyle(color: Colors.white),
                                  isDense: true,
                                  isExpanded: true,
                                  underline: SizedBox.shrink(),
                                  iconEnabledColor: Colors.grey,
                                  icon: Icon(
                                    LineIcons.angleDown,
                                    size: 12,
                                  ),
                                  items: COMPLEXES
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    'Жилой комплекс',
                                    style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 11,
                                    ),
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _selectedComplex = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// house plan
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ПЛАНИРОВКА',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ...HOUSE_PLANS.map(
                              (plan) {
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedHousePlan = plan;
                                      });
                                    },
                                    child: Container(
                                      height: 28,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(2),
                                      margin: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 0.5,
                                        ),
                                        color: _selectedHousePlan == plan
                                            ? Style.orange
                                            : Colors.white,
                                      ),
                                      child: FittedBox(
                                        child: Text(
                                          plan,
                                          style: TextStyle(
                                            color: _selectedHousePlan == plan
                                                ? Colors.white
                                                : null,
                                            fontSize: 11,
                                            fontWeight:
                                                _selectedHousePlan == plan
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
                        const SizedBox(height: 16),

                        /// house state
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'СОСТОЯНИЕ НЕДВИЖИМОСТИ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 28,
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            value: _selectedHouseState,
                            //elevation: 5,
                            style: TextStyle(color: Style.blue),
                            isDense: true,
                            isExpanded: true,
                            underline: SizedBox.shrink(),
                            iconEnabledColor: Style.blue,
                            icon: Icon(
                              LineIcons.angleDown,
                              size: 12,
                            ),
                            items: HOUSE_STATES
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: Style.blue,
                                    fontSize: 11,
                                  ),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              'Состояние недвижимости',
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 11,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _selectedHouseState = value;
                              });
                            },
                          ),
                        ),

                        /* Wrap(
                          children: [
                            ...HOUSE_STATES.map(
                              (state) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedHouseState = state;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        Global.getSize(context).width / 2 - 20,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(7),
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 0.5,
                                      ),
                                      color: _selectedHouseState == state
                                          ? Style.orange
                                          : Colors.white,
                                    ),
                                    child: FittedBox(
                                      child: Text(
                                        state,
                                        style: TextStyle(
                                          color: _selectedHouseState == state
                                              ? Colors.white
                                              : null,
                                          fontSize: 11,
                                          fontWeight:
                                              _selectedHouseState == state
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ],
                        ), */
                        const SizedBox(height: 16),

                        /// year of construction
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'ГОД ПОСТРОЙКИ',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            /// year from
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: TextFormField(
                                  controller: _yearFromC,
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
                                      color: Colors.grey.shade300,
                                      fontSize: 11,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            /// year to
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: TextFormField(
                                  controller: _yearToC,
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
                                      color: Colors.grey.shade300,
                                      fontSize: 11,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// size of bargaining
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'РАЗМЕР ТОРГА',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// bargain
                        Row(
                          children: [
                            /// bargain from
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: TextFormField(
                                  controller: _bargainFromC,
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
                                      color: Colors.grey.shade300,
                                      fontSize: 11,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            /// bargain to
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: TextFormField(
                                  controller: _bargainToC,
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
                                      color: Colors.grey.shade300,
                                      fontSize: 11,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    isDense: true,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// show only
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'ПОКАЗЫВАТЬ ТОЛЬКО',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// show only bargain
                        Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _bargain = !_bargain);
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
                                hintText: 'Есть торг',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                isDense: true,
                                suffixIcon: Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    value: _bargain,
                                    onChanged: (val) =>
                                        setState(() => _bargain = val),
                                    activeColor: Style.orange,
                                    inactiveThumbColor: Style.blue,
                                  ),
                                ),
                                enabled: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// show only _encumbrance (obremenenie)
                        Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _encumbrance = !_encumbrance);
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
                                hintText: 'Есть обременение',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                isDense: true,
                                suffixIcon: Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    value: _encumbrance,
                                    onChanged: (val) =>
                                        setState(() => _encumbrance = val),
                                    activeColor: Style.orange,
                                    inactiveThumbColor: Style.blue,
                                  ),
                                ),
                                enabled: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// exchange
                        Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _exchange = !_exchange);
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
                                hintText: 'Обмен',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                isDense: true,
                                suffixIcon: Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    value: _exchange,
                                    onChanged: (val) =>
                                        setState(() => _exchange = val),
                                    activeColor: Style.orange,
                                    inactiveThumbColor: Style.blue,
                                  ),
                                ),
                                enabled: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    )
                  : SizedBox.shrink(),
              /* ),*/

              /// extended search toggle
              InkWell(
                onTap: () {
                  setState(() {
                    _extendedSearch = !_extendedSearch;
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          'РАСШИРЕННЫЙ ПОИСК',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _extendedSearch
                              ? LineIcons.angleUp
                              : LineIcons.angleDown,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              /// buttons
              Row(
                children: [
                  /// reset button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: _clearSearch,
                        child: Text(
                          'Сбросить',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Style.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),

                  /// save search button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: FittedBox(
                          child: Text(
                            'Сохранить поиск',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).canvasColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: Style.blue,
                              width: 1,
                            ),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// search button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: SearchResultScreen(),
                      withNavBar: true,
                    );
                  },
                  child: Text(
                    'ПОИСК',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Style.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 36),

              /// hot adverts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'ГОРЯЩИЕ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Style.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 2, 6, 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              '${ADVERTS.length}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              OptionalAdvertsListView(),
              const SizedBox(height: 16),

              /// new adverts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'НОВЫЕ',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Style.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 2, 6, 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              '${ADVERTS.length}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              OptionalAdvertsListView(),

              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }

  void _clearSearch() {
    FocusScope.of(context).unfocus();
    setState(() {
      _priceFromC?.clear();
      _priceToC?.clear();
      _areaFromC?.clear();
      _areaToC?.clear();
      _regionC?.clear();
      _streetC?.clear();
      _complexC?.clear();
      _yearFromC?.clear();
      _yearToC?.clear();
      _bargainFromC?.clear();
      _bargainToC?.clear();
      _selectedHouseType = HOUSE_TYPE[0];
      _selectedRoom = ROOMS[0];
      _selectedHousePlan = HOUSE_PLANS[0];
      _selectedHouseState = HOUSE_STATES[0];
      _selectedRegion = null;
      _selectedComplex = null;
      _bargain = false;
      _encumbrance = false;
      _exchange = false;
    });
  }
}

class OptionalAdvertsListView extends StatelessWidget {
  final EdgeInsets padding;

  const OptionalAdvertsListView({Key key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: ADVERTS.length,
        itemBuilder: (c, index) {
          final advert = ADVERTS[index];
          return Container(
            height: double.infinity,
            width: 100,
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    advert['images'][index % 3],
                    fit: BoxFit.cover,
                    height: 100 / 3 * 4,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  advert['title'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${advert['rooms']} ком • ${advert['area']}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  advert['price'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
