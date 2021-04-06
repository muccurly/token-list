class RealPropertyComment {
  final String crDate;
  final String createdBy;
  final int id;
  final int questionId;
  final int realPropertyId;
  final String text;

  RealPropertyComment({
    this.crDate,
    this.createdBy,
    this.id,
    this.questionId,
    this.realPropertyId,
    this.text,
  });

  RealPropertyComment.fromJson(Map<String, dynamic> data)
      : crDate = data['crDate'] as String,
        createdBy = data['createdBy'] as String,
        id = data['id'] as int,
        questionId = data['questionId'] as int,
        realPropertyId = data['realPropertyId'] as int,
        text = data['text'] as String;

  Map<String, dynamic> toJson() => {
        'crDate': this.crDate,
        'createdBy': this.createdBy,
        'id': this.id,
        'questionId': this.questionId,
        'realPropertyId': this.realPropertyId,
        'text': this.text,
      };
}

class RealPropertyCommentResult {
  final List<RealPropertyComment> content;
  final bool empty;
  final bool first;
  final bool last;
  final int number;
  final int numberOfElements;
  final Map<String, dynamic> pageable;
  final int size;
  final Map<String, dynamic> sort;
  final int totalElements;
  final int totalPages;

  RealPropertyCommentResult({
    this.content,
    this.empty,
    this.first,
    this.last,
    this.number,
    this.numberOfElements,
    this.pageable,
    this.size,
    this.sort,
    this.totalElements,
    this.totalPages,
  });

  RealPropertyCommentResult.fromJson(Map<String, dynamic> jsonData)
      : content = jsonData['content'] == null
            ? []
            : (jsonData['content'] as List)
                .map((obj) => RealPropertyComment.fromJson(obj))
                .toList(),
        empty = jsonData['empty'] as bool,
        first = jsonData['first'] as bool,
        last = jsonData['last'] as bool,
        number = jsonData['number'] as int,
        numberOfElements = jsonData['numberOfElements'] as int,
        pageable = jsonData['pageable'] as Map<String, dynamic>,
        size = jsonData['size'] as int,
        sort = jsonData['sort'] as Map<String, dynamic>,
        totalElements = jsonData['totalElements'] as int,
        totalPages = jsonData['totalPages'] as int;
}

class RealPropertyCommentResponse {
  final dynamic result;
  final List<dynamic> error;

  RealPropertyCommentResponse({
    this.result,
    this.error,
  });

  RealPropertyCommentResponse.fromJson(Map<String, dynamic> jsonData)
      : result = jsonData == null
            ? RealPropertyCommentResult()
            : RealPropertyCommentResult.fromJson(jsonData),
        error = [];

  RealPropertyCommentResponse.withError(List<String> errorValue)
      : result = RealPropertyCommentResult(),
        error = errorValue;
}
