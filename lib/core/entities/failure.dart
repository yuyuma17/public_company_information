import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.timeoutFailure() = TimeoutFailure;
  const factory Failure.typeCastFailure() = TypeCastFailure;
  const factory Failure.unknownError() = UnknownError;
}
