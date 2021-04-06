import 'package:flutter/material.dart';
import 'package:jurta/models/models.dart';
import 'package:jurta/repositories/repositories.dart';
import 'package:rxdart/rxdart.dart';

class RealPropertyCommentBloc {
  final RealPropertyCommentRepository _realPropertyCommentRepository =
      RealPropertyCommentRepository();
  final BehaviorSubject<RealPropertyCommentResponse> _subject =
      BehaviorSubject<RealPropertyCommentResponse>();
  bool _loading = false;
  bool _hasMore = true;
  int _next;
  List<RealPropertyComment> _allRealPropertyComments;

  void reset() {
    _loading = false;
    _hasMore = true;
    _next = null;
    _allRealPropertyComments = null;
    _subject.sink.add(null);
  }

  Future<void> getAllRealPropertyComments({
    bool forceRefresh = false,
    bool more = false,
    @required int propertyId,
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
        _allRealPropertyComments?.clear();
      }
      if (_hasMore) {
        // blocErrorRealPropertyComment.subject.sink.add(null);
        _loading = true;
        if (more) {
          // blocLoadingRealPropertyComment.subject.sink.add(true);
        }

        RealPropertyCommentResponse response =
            await _realPropertyCommentRepository.getAllRealPropertyComments(
          forceRefresh: forceRefresh,
          more: more,
          next: _next,
          propertyId: propertyId,
        );

        if (response.error.isEmpty) {
          RealPropertyCommentResult result =
              (response.result as RealPropertyCommentResult);
          if (!result.last) {
            _next = result.pageable['pageNumber'] + 1;
            // if (_next == null) _hasMore = false;
          } else {
            _hasMore = false;
          }

          if (!more) {
            _allRealPropertyComments = result.content;
            _subject.sink.add(response);
          } else {
            var tempList = [..._allRealPropertyComments];
            tempList.addAll(result.content);
            _allRealPropertyComments = tempList;
            print('>>>loaded more<<<');
            print(_allRealPropertyComments.length);
            print(_allRealPropertyComments.hashCode);

            RealPropertyCommentResponse productResponse =
                RealPropertyCommentResponse(
              result: RealPropertyCommentResult(
                content: _allRealPropertyComments,
                empty: result.empty,
                first: result.first,
                last: result.last,
                number: result.number,
                numberOfElements: result.numberOfElements,
                pageable: result.pageable,
                size: result.size,
                sort: result.sort,
                totalElements: result.totalElements,
                totalPages: result.totalPages,
              ),
              error: response.error,
            );

            _subject.sink.add(productResponse);
          }
        } else if (response.result.empty != null && response.result.empty) {
          _hasMore = false;
          _subject.sink.add(RealPropertyCommentResponse(
            result: RealPropertyCommentResult(
              content: null,
              empty: response?.result?.empty,
              first: response?.result?.first,
              last: response?.result?.last,
              number: response?.result?.number,
              numberOfElements: response?.result?.numberOfElements,
              pageable: response?.result?.pageable,
              size: response?.result?.size,
              sort: response?.result?.sort,
              totalElements: response?.result?.totalElements,
              totalPages: response?.result?.totalPages,
            ),
            error: response.error,
          ));
        } else {
          _hasMore = false;
          if (!_subject.hasValue || _subject.value == null)
            _subject.sink.add(RealPropertyCommentResponse());
        }

        // blocLoadingRealPropertyComment.subject.sink.add(false);
        _loading = false;
      }
    }
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<RealPropertyCommentResponse> get subject => _subject;
}

final blocRealPropertyComment = RealPropertyCommentBloc();
