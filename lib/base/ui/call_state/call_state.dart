import 'package:flutter/material.dart';

class CallState<T> {
  Status status;
  T data;
  Exception exception;

  CallState() : status = Status.INITIAL;

  CallState.initial() : status = Status.INITIAL;

  CallState.progress() : status = Status.PROGRESS;

  CallState.success(this.data) : status = Status.SUCCESS;

  CallState.error(this.exception) : status = Status.ERROR;

  bool get isSuccessful => status == Status.SUCCESS;

  @override
  String toString() => "Status : $status \n Message : $exception \n Data : $data";

  // ignore: missing_return
  R when<R>({
    @required R initial(),
    @required R progress(),
    @required R success(T data),
    @required R error(Exception exception),
  }) {
    switch (this.status) {
      case Status.INITIAL:
        return initial();
      case Status.PROGRESS:
        return progress();
      case Status.SUCCESS:
        return success(data);
      case Status.ERROR:
        return error(exception);
    }
  }

  // ignore: missing_return
  R whenOrElse<R>({
    R initial(),
    R progress(),
    R success(T data),
    R error(Exception exception),
    @required R orElse(),
  }) {
    switch (this.status) {
      case Status.INITIAL:
        return initial?.call() ?? orElse();
      case Status.PROGRESS:
        return progress?.call() ?? orElse();
      case Status.SUCCESS:
        return success?.call(data) ?? orElse();
      case Status.ERROR:
        return error?.call(exception) ?? orElse();
    }
  }
}

enum Status { INITIAL, PROGRESS, SUCCESS, ERROR }
