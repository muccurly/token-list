import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String login;
  final String? email;
  final String? fullName;
  final String name;
  final int organizationId;
  final String organizationName;
  final String? patronymic;
  final String? phone;
  final String? photoUuid;
  final String surname;

  const User({
    this.email,
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
      id: json['id'] ?? json['userId'],
      login: json['login'] ?? json['userLogin'],
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
