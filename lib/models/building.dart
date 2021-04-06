class Building {
  final int id;
  final String number;
  final String postcode;
  final String longitude;
  final String latitude;
  final String houseNumber;

  Building({
    this.id,
    this.number,
    this.postcode,
    this.longitude,
    this.latitude,
    this.houseNumber,
  });

  Building.fromJson(Map<String, dynamic> data)
      : id = data['id'] as int,
        number = data['number'] as String,
        postcode = data['postcode'] as String,
        longitude = data['longitude'] as String,
        latitude = data['latitude'] as String,
        houseNumber = data['houseNumber'] as String;

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'number': this.number,
        'postcode': this.postcode,
        'longitude': this.longitude,
        'latitude': this.latitude,
        'houseNumber': this.houseNumber,
      };
}

class BuildingResult {
  final int size;
  final bool empty;
  final List<Building> data;

  BuildingResult({
    this.size,
    this.empty,
    this.data,
  });

  BuildingResult.fromJson(Map<String, dynamic> data)
      : data = data['data'] == null
            ? []
            : (data['data'] as List)
                .map((obj) => Building.fromJson(obj))
                .toList(),
        size = data['size'] as int,
        empty = data['empty'] as bool;

  Map<String, dynamic> toJson() => {
        'size': this.size,
        'empty': this.empty,
        'data': this.data.map((obj) => obj.toJson()).toList(),
      };
}

class BuildingResponse {
  final BuildingResult result;
  final List<dynamic> error;

  BuildingResponse({
    this.result,
    this.error,
  });

  BuildingResponse.fromJson(Map<String, dynamic> jsonData)
      : result = jsonData == null ? null : BuildingResult.fromJson(jsonData),
        error = [];

  BuildingResponse.withError(List<String> errorValue)
      : result = BuildingResult(),
        error = errorValue;
}
