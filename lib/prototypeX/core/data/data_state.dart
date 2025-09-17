import 'package:get/get.dart';

import '../values/app_strings.dart';

sealed class DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  final T? data;

  DataSuccess({required this.data});
}

class DataFailed<T> extends DataState<T> {
  final String error;
  final int? errorCode;

  DataFailed({String? error, this.errorCode})
      : error = error ?? Keys.Some_error_occurred.tr;
}
