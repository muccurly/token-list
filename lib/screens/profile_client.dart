import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jurta/screens/screens.dart';
import 'package:jurta/utils/utils.dart';

class ProfileClientScreen extends StatefulWidget {
  @override
  _ProfileClientScreenState createState() => _ProfileClientScreenState();
}

class _ProfileClientScreenState extends State<ProfileClientScreen> {
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _firstNameC = TextEditingController();
  final TextEditingController _lastNameC = TextEditingController();
  final TextEditingController _patronymicNameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _cityC = TextEditingController();
  final TextEditingController _birthDateC = TextEditingController();

  bool editingMode = false;

  @override
  void initState() {
    super.initState();
    _lastNameC.text = CLIENT_PROFILE['last_name'];
    _firstNameC.text = CLIENT_PROFILE['first_name'];
    _patronymicNameC.text = CLIENT_PROFILE['patronymic_name'];
    _emailC.text = CLIENT_PROFILE['email'];
    _phoneC.text = CLIENT_PROFILE['phone'];
    _cityC.text = CLIENT_PROFILE['city'];
    _birthDateC.text =
        '${DateFormat('dd.MM.yyyy').format(CLIENT_PROFILE['birth_date'])}';
  }

  @override
  void dispose() {
    _phoneC.dispose();
    _firstNameC.dispose();
    _lastNameC.dispose();
    _patronymicNameC.dispose();
    _emailC.dispose();
    _cityC.dispose();
    _birthDateC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            /// background image
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Global.getSize(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile_bg.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: ListView(
                shrinkWrap: true,
                children: [
                  /// avatar
                  Stack(
                    children: [
                      Positioned(
                        top: Global.getSize(context).width / 5 + 58,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: Global.getSize(context).width / 5 + 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: Global.getSize(context).width / 2.5 + 8,
                          width: Global.getSize(context).width / 2.5 + 8,
                          margin: const EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Stack(
                            children: [
                              /// avatar
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      CLIENT_PROFILE['imageUrl'] ??
                                          CLIENT_PROFILE['imagePath']),
                                  radius: Global.getSize(context).width / 5,
                                ),
                              ),

                              /// add new avatar
                              Visibility(
                                visible: editingMode,
                                child: Positioned(
                                  right: 16,
                                  bottom: 12,
                                  child: Image.asset(
                                    'assets/images/plus_round.png',
                                    height: 26,
                                    width: 26,
                                  ),
                                ),
                              ),

                              /// client badge
                              Visibility(
                                visible: !editingMode,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  0, 202, 191, 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              'Клиент',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// info
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    color: Colors.white,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        /// full name
                        Visibility(
                          visible: !editingMode,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${CLIENT_PROFILE['first_name']} ${CLIENT_PROFILE['last_name']}\n${CLIENT_PROFILE['patronymic_name']}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// fields
                        if (editingMode) ...[
                          InputFormField(
                            enabled: editingMode,
                            controller: _lastNameC,
                            fieldName: 'Фамилия:',
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          const SizedBox(height: 10),
                          InputFormField(
                            enabled: editingMode,
                            controller: _firstNameC,
                            fieldName: 'Имя:',
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          const SizedBox(height: 10),
                          InputFormField(
                            enabled: editingMode,
                            controller: _patronymicNameC,
                            fieldName: 'Отчество:',
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          const SizedBox(height: 10),
                        ],
                        InputFormField(
                          enabled: editingMode,
                          controller: _phoneC,
                          fieldName: 'Номер телефона:',
                          keyboardType: TextInputType.phone,
                          textInputFormatters: PHONE_FORMATTER,
                        ),
                        const SizedBox(height: 10),
                        InputFormField(
                          enabled: editingMode,
                          controller: _emailC,
                          fieldName: 'Почтовый адрес:',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        InputFormField(
                          enabled: editingMode,
                          controller: _cityC,
                          fieldName: 'Ваш город:',
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 10),
                        InputFormField(
                          enabled: editingMode,
                          controller: _birthDateC,
                          fieldName: 'Дата рождения:',
                          keyboardType: TextInputType.name,
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            final newBirthDay = await showDatePicker(
                              context: context,
                              initialDate: CLIENT_PROFILE['birth_date'] ??
                                  DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (newBirthDay != null) {
                              setState(() {
                                CLIENT_PROFILE['birth_date'] = newBirthDay;
                                _birthDateC.text =
                                    '${DateFormat('dd.MM.yyyy').format(newBirthDay)}';
                              });
                            }
                          },
                        ),

                        /// edit button
                        Visibility(
                          visible: !editingMode,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 50),
                            child: Center(
                              child: Container(
                                height: 46,
                                width: Global.getSize(context).width * 0.6,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      editingMode = !editingMode;
                                    });
                                  },
                                  child: Text(
                                    'Редактировать',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Style.blue,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// save and cancel buttons
                        Visibility(
                          visible: editingMode,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          editingMode = !editingMode;
                                        });
                                      },
                                      child: Text(
                                        'Отменить',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Style.blue,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          editingMode = !editingMode;
                                        });
                                      },
                                      child: Text(
                                        'СОХРАНИТЬ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Style.orange,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// back button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.only(
                    top: Global.getViewPadding(context).top > 0
                        ? Global.getViewPadding(context).top
                        : 24),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputFormField extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String fieldName;
  final List<TextInputFormatter> textInputFormatters;
  final Function onTap;
  final TextCapitalization textCapitalization;

  const InputFormField({
    Key key,
    @required this.enabled,
    @required this.controller,
    @required this.fieldName,
    this.textInputFormatters,
    this.keyboardType,
    this.onTap,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                fieldName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(240, 240, 240, 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                enabled: enabled,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                onTap: onTap ?? () => {},
                inputFormatters: textInputFormatters ?? [],
                controller: controller,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(51, 51, 51, 1.0)),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  isDense: true,
                ),
                keyboardType: keyboardType ?? TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
