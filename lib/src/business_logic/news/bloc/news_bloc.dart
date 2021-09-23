import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required IPropertyRepository propertyRepository,
  })  : _propertyRepository = propertyRepository,
        super(
          NewsState(
            filter: RealPropertyFilter().copyWith(
              flagId: null,
              objectTypeId: null,
              showNew: true,
            ),
          ),
        );

  final IPropertyRepository _propertyRepository;

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNews)
      yield* _mapLoadNewsToState();
    else if (event is LoadNewsMore) yield* _mapLoadNewsMoreToState();
  }

  Stream<NewsState> _mapLoadNewsToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        List<RealProperty> list =
            await _propertyRepository.findNews(state.filter);
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            firstLoad: false,
            properties: list,
            pagination: _propertyRepository.newsPagination,
            filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: null,
              pageNumber: _propertyRepository.newsPagination!.pageNumber,
            ));
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      } catch (e) {
        MyLogger.instance.log.e(e.toString());
      }
    }
    yield state.copyWith(
      status: FormzStatus.submissionFailure,
    );
  }

  Stream<NewsState> _mapLoadNewsMoreToState() async* {

    if (_propertyRepository.newsPagination != null) {
      if (state.filter.pageNumber <
          _propertyRepository.newsPagination!.size - 1) {
        if (await InternetConnectionChecker().hasConnection) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          try {
            List<RealProperty> list =
                await _propertyRepository.findNews(state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: null,
              pageNumber: state.filter.pageNumber + 1,
            ));
            yield state.copyWith(
              status: FormzStatus.submissionSuccess,
              properties: list,
              pagination: _propertyRepository.newsPagination,
              filter: state.filter.copyWith(
                flagId: state.filter.flagId,
                objectTypeId: null,
                pageNumber: _propertyRepository.newsPagination!.pageNumber,
              ),
            );
            return;
          } on DioError catch (e) {
            MyLogger.instance.log.e(e.message);
          } catch (e) {
            MyLogger.instance.log.e(e.toString());
          }
        }
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
