import 'package:freezed_annotation/freezed_annotation.dart';

part 'redirect_failures.freezed.dart';

@freezed
class RedirectFailure with _$RedirectFailure {
  const factory RedirectFailure.materialDetailRoute() = _MaterialDetailRoute;
  const factory RedirectFailure.historyDetailRoute() = _HistoryDetailRoute;
}

extension RedirectFailureExt on RedirectFailure {
  String get failureMessage {
    final failureMessage = map(
      materialDetailRoute: (_) =>
          'This material is not available on your account',
      historyDetailRoute: (_) =>
          'This order history is not available on your account',
    );

    return failureMessage;
  }
}
