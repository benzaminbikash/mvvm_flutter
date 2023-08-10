import 'package:mvvm/data/response/status.dart';

class AppResponse<T> {
  Status? status;
  T? data;
  String? message;
  AppResponse(this.status, this.data, this.message);
  AppResponse.loading() : status = Status.LOADING;
  AppResponse.complete() : status = Status.COMPLETE;
  AppResponse.error() : status = Status.ERROR;

  String toString() {
    return 'Status $status \n Data $data \n Message $message ';
  }
}
