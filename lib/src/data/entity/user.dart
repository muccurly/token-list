class User {
  String email;
  String fullName;
  int id;
  String login;
  String name;
  int organizationId;
  String organizationName;
  String patronymic;
  String phone;
  String photoUuid;
  String surname;

  User({
    required this.email,
    required this.fullName,
    required this.id,
    required this.login,
    required this.name,
    required this.organizationId,
    required this.organizationName,
    required this.patronymic,
    required this.phone,
    required this.photoUuid,
    required this.surname,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      email: json['email'],
      fullName: json['fullName'],
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
}
