import 'package:dio/dio.dart';
import 'package:jurta/utils/utils.dart';

List<String> handleError(dynamic error) {
  String errorDescription = '';
  if (error is DioError) {
    DioError dioError = error as DioError;
    log('>>>Error status code: ${dioError?.response?.statusCode}');
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = 'Запрос на сервер был отменен';
        break;
      case DioErrorType.connectTimeout:
        errorDescription = 'Тайм-аут соединения с сервером';
        break;
      case DioErrorType.other:
        var errRes = dioError?.response;
        log(errRes?.data);
        log(errRes?.statusCode);
        log(errRes?.statusMessage);
        log(dioError?.error);
        log(dioError?.message);
        errorDescription =
            'Не удалось подключиться к серверу из-за интернет-соединения';
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = 'Тайм-аут получения соединения с сервером API';
        break;
      case DioErrorType.response:
        var errRes = dioError.response;
        log(errRes?.data);
        log(errRes?.statusCode);
        log(errRes?.statusMessage);

        if (errRes?.statusCode == 401) {
          errorDescription = 'Вы не авторизованы';
        } else {
          errorDescription = '${errRes?.data}' ??
              '${errRes?.statusMessage}' ??
              '${errRes?.statusCode}' ??
              'DioErrorType.response';
        }
        errorDescription = 'Произошла ошибка: ${dioError.response.statusCode}';
        // errorDescription =
        //     'Получен неверный код статуса: ${dioError.response.statusCode}';
        break;
      case DioErrorType.sendTimeout:
        errorDescription = 'Тайм-аут отправки соединения с сервером API';
        break;
    }
  } else {
    errorDescription = 'Произошла непредвиденная ошибка';
  }
  return [errorDescription];
}
