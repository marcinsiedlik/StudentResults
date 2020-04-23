import 'package:flutter/foundation.dart';
import 'package:results/base/logger/logger.dart';
import 'package:results/base/ui/call_state/call_state.dart';

abstract class BaseNotifier with ChangeNotifier {
  void dispatch<T>({
    @required CallState<T> callState,
    @required Future<T> block(),
    onSuccess(T result),
    onError(Exception e),
  }) async {
    _updateStatusAndNotify(callState, Status.PROGRESS);
    try {
      final response = await block();
      onSuccess?.call(response);
      callState.data = response;
      _updateStatusAndNotify(callState, Status.SUCCESS);
    } on Error catch (e, st) {
      logger.e('Dispatch error: ', e, st);
    } catch (e, st) {
      logger.e('Dispatch exception: ', e.runtimeType, st);
      onError?.call(e);
      callState.exception = e;
      _updateStatusAndNotify(callState, Status.ERROR);
    }
  }

  void _updateStatusAndNotify(CallState callState, Status status) {
    callState.status = status;
    notifyListeners();
  }
}
