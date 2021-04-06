class MultiLang {
  final String nameKz;
  final String nameRu;
  final String nameEn;

  MultiLang({
    this.nameKz,
    this.nameRu,
    this.nameEn,
  });

  MultiLang.fromJson(Map<String, dynamic> data)
      : nameKz = data['nameKz'] as String,
        nameRu = data['nameRu'] as String,
        nameEn = data['nameEn'] as String;

  Map<String, dynamic> toJson() => {
        'nameKz': this.nameKz,
        'nameRu': this.nameRu,
        'nameEn': this.nameEn,
      };
}
