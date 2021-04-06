import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jurta/models/models.dart';
import 'package:jurta/repositories/repositories.dart';
import 'package:jurta/services/services.dart';
import 'package:jurta/utils/utils.dart';

class RealPropertyCommentRepository {
  final _realPropertyCommentsUrl = REAL_PROPERTY_COMMENTS_BY_PROPERTY_ID_URL;

  Future<RealPropertyCommentResponse> getAllRealPropertyComments({
    bool forceRefresh = false,
    bool more = false,
    int next,
    @required int propertyId,
  }) async {
    var params;
    if (next != null)
      params = {
        'direction': 'ASC',
        'pageNumber': next ?? 0,
        'pageSize': 10,
        'sortBy': 'id',
      };
    // var url = next != null ? next : _realPropertyCommentsUrl;

    try {
      final Response response = await DioService.getDio().get(
        _realPropertyCommentsUrl + '$propertyId',
        queryParameters: params,
        // options: buildCacheOptions(
        //   Duration(minutes: 10),
        //   forceRefresh: forceRefresh,
        //   primaryKey: _endpoint,
        //   subKey: '$page${json.encode(params)}',
        // ),
      );
      print(response.data);
      return RealPropertyCommentResponse.fromJson(response.data);
    } on SocketException {
      print('RealPropertyCommentRepository Socket Exception');
      // blocErrorRealPropertyComment.subject.sink
      //     .add('Нет соединения с интернетом');
      return RealPropertyCommentResponse.withError(
          ['Нет соединения с интернетом']);
    } catch (error, stacktrace) {
      print(
          'RealPropertyCommentRepository Exception occured: $error stackTrace: $stacktrace');
      print(handleError(error));
      // blocErrorRealPropertyComment.subject.sink
      //     .add(handleError(error).join(', '));
      return RealPropertyCommentResponse.withError(handleError(error));
    }
  }
}
