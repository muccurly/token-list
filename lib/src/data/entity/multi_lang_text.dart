class MultiLangText {
  String nameRu;
  String nameKz;
  String nameEn;

  MultiLangText({
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
}
