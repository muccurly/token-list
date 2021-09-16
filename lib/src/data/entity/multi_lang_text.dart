import 'package:equatable/equatable.dart';

class MultiLangText extends Equatable {
  final String nameRu;
  final String nameKz;
  final String nameEn;

  const MultiLangText({
    required this.nameRu,
    required this.nameKz,
    required this.nameEn,
  });

  factory MultiLangText.fromJson(Map<String, dynamic> json){
    return MultiLangText(
      nameRu: json['nameRu'],
      nameKz: json['nameKz'],
      nameEn: json['nameEn'],
    );
  }

  @override
  List<Object?> get props => [nameRu, nameKz, nameEn];
}
