import 'package:flutter/material.dart';
import 'package:jurta/bloc/bloc.dart';
import 'package:jurta/models/models.dart';
import 'package:jurta/repositories/repositories.dart';
import 'package:jurta/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class RealPropertyVideoTourBloc {
  final RealPropertyVideoTourRepository _realPropertyVideoTourRepository =
      RealPropertyVideoTourRepository();
  final BehaviorSubject<RealPropertyVideoTourResponse> _subject =
      BehaviorSubject<RealPropertyVideoTourResponse>();
  bool _loading = false;
  bool _hasMore = true;
  int _next;
  List<RealPropertyVideoTour> _allRealPropertyVideoTours;

  void reset() {
    _loading = false;
    _hasMore = true;
    _next = null;
    _allRealPropertyVideoTours = null;
    _subject.sink.add(null);
  }

  Future<void> getAllRealPropertyVideoTours({
    bool forceRefresh = false,
    bool more = false,
  }) async {
    if (!forceRefresh && !more) {
      if (_subject.hasValue && _subject.value != null) return;
    }
    if (_subject.hasValue && _subject.value != null) return;
    if (!_loading) {
      if (!more) _subject.sink.add(null);
      if (!more && (forceRefresh)) {
        _next = null;
        _hasMore = true;
        _allRealPropertyVideoTours?.clear();
      }
      if (_hasMore) {
        blocErrorRealPropertyVideoTour.subject.sink.add(null);
        _loading = true;
        if (more) {
          blocLoadingRealPropertyVideoTour.subject.sink.add(true);
        }

        RealPropertyVideoTourResponse response =
            await _realPropertyVideoTourRepository.getAllRealPropertyVideoTours(
          forceRefresh: forceRefresh,
          more: more,
          next: _next,
        );

        if (response.error.isEmpty) {
          RealPropertyVideoTourResult result =
              (response.result as RealPropertyVideoTourResult);
          if (result.success && result.code == 200) {
            _next = result.data.pageNumber + 1;
            // if (_next == null) _hasMore = false;
          } else {
            _hasMore = false;
          }

          if (!more) {
            _allRealPropertyVideoTours = result.data.data.data;
            _subject.sink.add(response);
          } else {
            var tempList = [..._allRealPropertyVideoTours];
            tempList.addAll(result.data.data.data);
            _allRealPropertyVideoTours = tempList;
            log('>>>loaded more<<<');
            log(_allRealPropertyVideoTours.length);
            log(_allRealPropertyVideoTours.hashCode);

            RealPropertyVideoTourResponse productResponse =
                RealPropertyVideoTourResponse(
              result: RealPropertyVideoTourResult(
                data: RealPropertyVideoTourResultData(
                  data: RealPropertyVideoTourResultDataData(
                    data: _allRealPropertyVideoTours,
                    empty: result.data.data.empty,
                    size: result.data.data.size,
                  ),
                  pageNumber: result.data.pageNumber,
                  size: result.data.size,
                  total: result.data.total,
                ),
                success: result.success,
                code: result.code,
              ),
              error: response.error,
            );

            _subject.sink.add(productResponse);
          }
        } else if (response.result.success != null &&
            !response.result.success &&
            response.result.code != 200) {
          _hasMore = false;
          _subject.sink.add(RealPropertyVideoTourResponse(
            result: RealPropertyVideoTourResult(
              data: null,
              success: response?.result?.success,
              code: response?.result?.code,
            ),
            error: response.error,
          ));
        } else {
          _hasMore = false;
          if (!_subject.hasValue || _subject.value == null)
            _subject.sink.add(RealPropertyVideoTourResponse());
        }

        blocLoadingRealPropertyVideoTour.subject.sink.add(false);
        _loading = false;
      }
    }
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<RealPropertyVideoTourResponse> get subject => _subject;
}

final blocRealPropertyVideoTour = RealPropertyVideoTourBloc();
