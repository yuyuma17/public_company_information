import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../entities/failure.dart';

Future<Either<Failure, T?>> wrapRemoteCall<T>(Future<T> future) async {
  try {
    final result = await future;
    return Right(result);
  } on DioError catch (e) {
    if (e.type == DioErrorType.connectTimeout) {
      return const Left(TimeoutFailure());
    }
    return const Left(ServerFailure());
  } on TypeError catch (_) {
    return const Left(TypeCastFailure());
  } catch (_) {
    return const Left(ServerFailure());
  }
}
