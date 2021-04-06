class RealPropertyVideoTour {
  final int realPropertyId;
  final int applicationId;
  final String creationDate;
  final int objectPrice;
  final int numberOfRooms;
  final double totalArea;
  final int floor;
  final String residentialComplex;
  final Map<String, dynamic> address;
  final String currentAgentPhoto;
  final String currentAgent;
  final String currentAgentName;
  final String currentAgentSurname;
  final String currentAgentPatronymic;
  final List<dynamic> virtualTourImageIdList;

  RealPropertyVideoTour({
    this.realPropertyId,
    this.applicationId,
    this.creationDate,
    this.objectPrice,
    this.numberOfRooms,
    this.totalArea,
    this.floor,
    this.residentialComplex,
    this.address,
    this.currentAgentPhoto,
    this.currentAgent,
    this.currentAgentName,
    this.currentAgentSurname,
    this.currentAgentPatronymic,
    this.virtualTourImageIdList,
  });

  RealPropertyVideoTour.fromJson(Map<String, dynamic> data)
      : realPropertyId = data['realPropertyId'] as int,
        applicationId = data['applicationId'] as int,
        creationDate = data['creationDate'] as String,
        objectPrice = data['objectPrice'] as int,
        numberOfRooms = data['numberOfRooms'] as int,
        totalArea = data['totalArea'] as double,
        floor = data['floor'] as int,
        residentialComplex = data['residentialComplex'] as String,
        address = data['address'] as Map<String, dynamic>,
        currentAgentPhoto = data['currentAgentPhoto'] as String,
        currentAgent = data['currentAgent'] as String,
        currentAgentName = data['currentAgentName'] as String,
        currentAgentSurname = data['currentAgentSurname'] as String,
        currentAgentPatronymic = data['currentAgentPatronymic'] as String,
        virtualTourImageIdList = data['virtualTourImageIdList'] as List<dynamic>;

  Map<String, dynamic> toJson() => {
        'realPropertyId': this.realPropertyId,
        'applicationId': this.applicationId,
        'creationDate': this.creationDate,
        'objectPrice': this.objectPrice,
        'numberOfRooms': this.numberOfRooms,
        'totalArea': this.totalArea,
        'floor': this.floor,
        'residentialComplex': this.residentialComplex,
        'address': this.address,
        'currentAgentPhoto': this.currentAgentPhoto,
        'currentAgent': this.currentAgent,
        'currentAgentName': this.currentAgentName,
        'currentAgentSurname': this.currentAgentSurname,
        'currentAgentPatronymic': this.currentAgentPatronymic,
        'virtualTourImageIdList': this.virtualTourImageIdList,
      };
}

class RealPropertyVideoTourResultDataData {
  final bool empty;
  final int size;
  final List<RealPropertyVideoTour> data;

  RealPropertyVideoTourResultDataData({
    this.empty,
    this.size,
    this.data,
  });

  RealPropertyVideoTourResultDataData.fromJson(Map<String, dynamic> jsonData)
      : empty = jsonData['empty'] as bool,
        size = jsonData['size'] as int,
        data = jsonData['data'] == null
            ? []
            : (jsonData['data'] as List)
                .map((obj) => RealPropertyVideoTour.fromJson(obj))
                .toList();
}

class RealPropertyVideoTourResultData {
  final int pageNumber;
  final int total;
  final int size;
  final RealPropertyVideoTourResultDataData data;

  RealPropertyVideoTourResultData({
    this.pageNumber,
    this.total,
    this.size,
    this.data,
  });

  RealPropertyVideoTourResultData.fromJson(Map<String, dynamic> jsonData)
      : pageNumber = jsonData['pageNumber'] as int,
        total = jsonData['total'] as int,
        size = jsonData['size'] as int,
        data = jsonData['data'] == null
            ? RealPropertyVideoTourResultDataData()
            : RealPropertyVideoTourResultDataData.fromJson(jsonData['data']);
}

class RealPropertyVideoTourResult {
  final RealPropertyVideoTourResultData data;
  final bool success;
  final int code;

  RealPropertyVideoTourResult({
    this.data,
    this.success,
    this.code,
  });

  RealPropertyVideoTourResult.fromJson(Map<String, dynamic> jsonData)
      : data = jsonData['data'] == null
            ? RealPropertyVideoTourResultData()
            : RealPropertyVideoTourResultData.fromJson(jsonData['data']),
        success = jsonData['success'] as bool,
        code = jsonData['code'] as int;
}

class RealPropertyVideoTourResponse {
  final dynamic result;
  final List<dynamic> error;

  RealPropertyVideoTourResponse({
    this.result,
    this.error,
  });

  RealPropertyVideoTourResponse.fromJson(Map<String, dynamic> jsonData)
      : result = jsonData == null
            ? RealPropertyVideoTourResult()
            : RealPropertyVideoTourResult.fromJson(jsonData),
        error = [];

  RealPropertyVideoTourResponse.withError(List<String> errorValue)
      : result = RealPropertyVideoTourResult(),
        error = errorValue;
}
