import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jurta/bloc/bloc.dart';
import 'package:jurta/models/models.dart';
import 'package:jurta/repositories/repositories.dart';
import 'package:jurta/services/services.dart';
import 'package:jurta/utils/utils.dart';

class RealPropertyVideoTourRepository {
  final _realPropertyVideoToursUrl = REAL_PROPERTY_VIDEO_TOUR_LIST_URL;

  Future<RealPropertyVideoTourResponse> getAllRealPropertyVideoTours({
    bool forceRefresh = false,
    bool more = false,
    int next,
  }) async {
    // var params;
    // if (next != null) params = {'page': next};
    // var url = next != null ? next : _realPropertyVideoToursUrl;
    final data = {
      'direction': 'ASC',
      'pageNumber': next ?? 0,
      'pageSize': 10,
      'sortBy': 'id'
    };

    try {
      final Response response = await DioService.getDio().post(
        _realPropertyVideoToursUrl,
        // queryParameters: params,
        data: data,
        // options: buildCacheOptions(
        //   Duration(minutes: 10),
        //   forceRefresh: forceRefresh,
        //   primaryKey: _endpoint,
        //   subKey: '$page${json.encode(params)}',
        // ),
      );
      log(response.data);
      return RealPropertyVideoTourResponse.fromJson(response.data);
    } on SocketException {
      log('RealPropertyVideoTourRepository Socket Exception');
      blocErrorRealPropertyVideoTour.subject.sink
          .add('Нет соединения с интернетом');
      return RealPropertyVideoTourResponse.withError(
          ['Нет соединения с интернетом']);
    } catch (error, stacktrace) {
      log('RealPropertyVideoTourRepository Exception occured: $error stackTrace: $stacktrace');
      log(handleError(error));
      blocErrorRealPropertyVideoTour.subject.sink
          .add(handleError(error).join(', '));
      return RealPropertyVideoTourResponse.withError(handleError(error));
    }
  }
}
