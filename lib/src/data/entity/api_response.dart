class ApiResponse<T> {
  bool success;
  int code;
  Pagination<T> data;

  ApiResponse({
    required this.success,
    required this.code,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json,
      Function fromJsonModel) {
    return ApiResponse<T>(
      success: json['success'],
      code: json['code'],
      data: Pagination<T>.fromJson(json['data'], fromJsonModel),
    );
  }

  @override
  String toString() {
    return 'ApiResponse{success: $success, code: $code, data: $data}';
  }
}

class Pagination<T> {
  int pageNumber;
  int total;
  int size;
  Data<T> data;

  Pagination({
    required this.pageNumber,
    required this.total,
    required this.size,
    required this.data,
  });

  factory Pagination.fromJson(Map<String, dynamic> json,
      Function fromJsonModel) {
    return Pagination<T>(
      pageNumber: json['pageNumber'],
      total: json['total'],
      size: json['size'],
      data: Data.fromJson(json['data'], fromJsonModel),
    );
  }

  @override
  String toString() {
    return 'Pagination{pageNumber: $pageNumber, total: $total, size: $size, data: $data}';
  }
}

class Data<T> {
  int size;
  bool empty;
  List<T> data;

  Data({
    required this.size,
    required this.empty,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json, Function fromJsonModel) {
    final items = json['data'] as List;
    return Data<T>(
      size: json['size'],
      empty: json['empty'],
      data: List<T>.from(items.map((e) => fromJsonModel(e))),
    );
  }

  @override
  String toString() {
    return 'Data{size: $size, empty: $empty, data: $data}';
  }
}
