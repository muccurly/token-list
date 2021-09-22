import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String login;
<<<<<<< HEAD
  final String email;
=======
  final String? email;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  final String fullName;
  final String name;
  final int organizationId;
  final String organizationName;
  final String? patronymic;
<<<<<<< HEAD
  final String phone;
=======
  final String? phone;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  final String? photoUuid;
  final String surname;

  const User({
<<<<<<< HEAD
    required this.email,
=======
    this.email,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    required this.fullName,
    required this.id,
    required this.login,
    required this.name,
    required this.organizationId,
    required this.organizationName,
    this.patronymic,
    required this.phone,
    this.photoUuid,
    required this.surname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fullName: json['fullname'],
      id: json['id'],
      login: json['login'],
      name: json['name'],
      organizationId: json['organizationId'],
      organizationName: json['organizationName'],
      patronymic: json['patronymic'],
      phone: json['phone'],
      photoUuid: json['photoUuid'],
      surname: json['surname'],
    );
  }

  @override
  List<Object?> get props => [
        email,
        fullName,
        id,
        login,
        name,
        organizationId,
        organizationName,
        patronymic,
        phone,
        photoUuid,
        surname,
      ];
}
